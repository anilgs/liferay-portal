<?xml version="1.0" encoding="UTF-8"?>

<beans
	default-init-method="afterPropertiesSet"
	xmlns="http://www.springframework.org/schema/beans"
	xmlns:aop="http://www.springframework.org/schema/aop"
	xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
	xsi:schemaLocation="http://www.springframework.org/schema/aop http://www.springframework.org/schema/aop/spring-aop-3.0.xsd http://www.springframework.org/schema/beans http://www.springframework.org/schema/beans/spring-beans-3.0.xsd"
>
	<bean id="com.liferay.portal.dao.shard.ShardAdvice" class="com.liferay.portal.dao.shard.ShardAdvice" />
	<bean id="com.liferay.portal.dao.shard.ShardUtil" class="com.liferay.portal.dao.shard.ShardUtil">
		<property name="shardAdvice" ref="com.liferay.portal.dao.shard.ShardAdvice" />
	</bean>
	<aop:config>
		<aop:aspect ref="com.liferay.portal.dao.shard.ShardAdvice">
			<aop:around pointcut="bean(*Persistence) || bean(*Finder)" method="invokePersistence" />
		</aop:aspect>
	</aop:config>
</beans>