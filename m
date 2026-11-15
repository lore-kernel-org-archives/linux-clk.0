Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794752882;
	b=PWhXazFJkxkr6f0Vg80ZHw71/QqHmlrnr+CjkBx3eDAVgH8lqXZMtw1jyLkTHEsygTxK
	 xGa3pe2Zv88XDqn4qfs1fQ49f3bR8FkG+QGlvPGYwvbH8ujRyGtJIzqNrGzuMvMIZk4Wp
	 0z/hTNwO7kywMMiLaATsLFgd1wAUcGi27ap9K8PiYhixn0rim5WdZ7sRpGSn5U3CtDbkk
	 4aJ1XqUEy1+Dn9gD1uA3JGfOXn3u3FpPSX1C8gNx2kbtrWqjZe6O/OcWq3x1rme5NGQVe
	 7eOxQS79eKGOmkZpN18q7trBOon/KPyaFO9slCflUIO01uWvBAjIbkS6eCosd8yxv5w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794752882;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=2sEy+yKxTZ/xGVRJAvsX6+GY6brY5WnNBV7SvMXqFes=;
	b=v6j/ASaHQsvZFDCktA9J383dSaGehqgMg7Dx1RDdcebxJHbuGgDjfN7Bui4PPTlzyAsU
	 efXoucbIuX9nn2whArs4QNZAaJXFv1ZHhJRWS6MRrQRnx0y9N1ZKNasKYlSlg/y+BYCQK
	 48lp1BXzYvkjXGHsgeBG67jv839dKvgsWRVlpVcPAu/B2ndTdGTElTZD+hVvxTLyLHzg+
	 3fkeDfk14q0ssnnBcnVnoXzGxv0oF+rFe+9krVeeP6RkD9k2KAHDpGu2Ef0i6WjjzurAK
	 5GqkLv92LR+33p14EZdWdAuLY/8YTcuNMZ0+YOhrLoOUOLWJewXu75XR6QYc0W7GkJA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WE3HcLfI;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79B93606A31D;
	Sun, 15 Nov 2026 14:28:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WE3HcLfI
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E58E91F000C4;
	Sun, 15 Nov 2026 14:27:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794752882;
	bh=2sEy+yKxTZ/xGVRJAvsX6+GY6brY5WnNBV7SvMXqFes=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=WE3HcLfIDZZ45snquMcmVMk45vbUEm7Sn6YKy0m/CuhmQSMQ4EW/dp6xOMOS5Mh6S
	 glR8Bu+rl6Lo+RUM8JLJRh+vJ0MPJ19Ml9+AKByV5CrDyYjTOB4mZTRoICLjVjZcqV
	 4JEhE+StLC/YXiyt1ALDT/T1vIyvNfZe2AGM7a+7dhqIyuXrAZLQ7sCoxos6ACBMul
	 iMaY0M0AJpG/ZNhf+UHWKJQH/Zqg+qBGm8IPq3A8v1GqMzbjduaGcfdnJhXB9dYppD
	 PpDm764+dkLkgpXaVhIzSIuQDHLaIKFAnaZDdh7k91x0F/Zafyv4y6qs70IcrKopvo
	 W1VJ8Pzm+zj/w==
Message-ID: <bddd429a-07e5-429e-af28-a0f40c58eff3@kernel.org>
Date: Sun, 15 Nov 2026 16:27:58 +0200
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 13/16] ARM: dts: microchip: sama7g5: Add OTPC clocks
To: Alexander Dahl <ada@thorsis.com>
Cc: Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Ryan Wanner <ryan.wanner@microchip.com>,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
References: <20261105110715.2486432-1-ada@thorsis.com>
 <20261105110715.2486432-14-ada@thorsis.com>
Content-Language: en-US
From: Claudiu Beznea <claudiu.beznea@kernel.org>
In-Reply-To: <20261105110715.2486432-14-ada@thorsis.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 11/5/26 13:06, Alexander Dahl wrote:
> These clocks should be enabled, datasheet says:
> 
>> The OTPC is clocked through the Power Management Controller (PMC).
>> The user must power on the main RC oscillator and enable the
>> peripheral clock of the OTPC prior to reading or writing the OTP
>> memory.
> Earlier discussions suggest, MCK0 must be enabled, too.  MCK0 is parent
> of peripheral otpc_clk, so this is done implicitly.
> 
> Link:https://lore.kernel.org/linux-clk/ec34efc2-2051-4b8a- 
> b5d8-6e2fd5e08c28@microchip.com/T/#u
> Signed-off-by: Alexander Dahl<ada@thorsis.com>

Reviewed-by: Claudiu Beznea <claudiu.beznea@kernel.org>
