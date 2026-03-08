Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E6AF313E3D
	for <linux-clk@vger.kernel.org>; Sun,  8 Mar 2026 16:12:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772986334; cv=none; b=apigCQO9w+c3EQhLNQxCjhtAONo49EPfnuiiIXfBJn4oOqDxsyLWpjEx0++Aabkm2qL6EdiAgEWU75Gtc038mdxPNEe/8SAMQOh2scBAmALAMsK+M8ffaK7CNjAbuu8vk2GjJeBzs1guP9BiE+ddQboSEXDWMoGDnjxV4oyX9RE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772986334; c=relaxed/simple;
	bh=LjFlqG3/syx+R7HqVGg5skm86j3H1h7rW3ze72w6frM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CWj80YVeiDL66s20oIxJhXTjE0sEcD5gbUKcznQSAZKUp3ymKmHgkNaWZZitP3XgDAPhFn+53OORvrKERl9CL1il2Od3iemwj06heS7l8Uzp+QOELqmbO3jGR5mz9RJeDGcBYbke5v1LpTTig+bpmKOgxZOOMekZupWwjEyO9vE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=FlEmjmFv; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="FlEmjmFv"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4807068eacbso90639395e9.2
        for <linux-clk@vger.kernel.org>; Sun, 08 Mar 2026 09:12:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1772986331; x=1773591131; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MCvFjV8EVaef8yL+ehrSZi3neS4JtlD4VmzZ+01tNOs=;
        b=FlEmjmFvcnmNOQvtP7rW2P9zsKXSq5C0pcQmGRM4Y2Z0p7wEWt8pVBCp/kGLv0eW4k
         JP/pvOJVVMn2lJaqNhuKC7W/mVQLd5UvaEPrtdf7YaB89ztFjTsfxZYLO+lrsonQ7GV9
         nHmhIp9TPPr+4MyIbfIBrd9ik77Fna7fTS6tjqKH7K1tFiadE8tPhnBIqXERhiUbsj2Z
         n5vB1U7OgiriDdqYp5z7+5Rqb4+G16KVtfWCL56OSSvmWTtVGdgv6NTE+hhumNPjCTou
         yHRxdnrJedSFUTau5UAHbEr5mDNFaFMAESIhIwhaFMvX0/0q3CmTnoVUwyOtEpQ5400h
         SySA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772986331; x=1773591131;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MCvFjV8EVaef8yL+ehrSZi3neS4JtlD4VmzZ+01tNOs=;
        b=hWiKVOm+t36+K7e/aCFc4w+bNlOvLAWeuR4iydBuWlskc4NJYTIXYGThoNpGyRQ3cx
         hrGSZ6wllZcWQ3qVO1m1njB8lEXMFW8Ktn1vSZOHEExkskqrtNnQSbGvgLQ8/YxmFSlj
         fisUh1EgJKvnB75Vm9kP54AF9janI9RL7id/wHqH44m6z+pe7bfaxFbyvxw55hxPMWnG
         TCH0fxsKjNYFGjPbk2gwOmLY2UMJW/2Fk/lXdrUAABx8AyecSyRvBpNVB0rS+U/Zm3Hn
         x/soQWBKTnNmyuI0KTLJypLZ2XoWuSeMMfuQ6/7GQOJ7C5B+HQHp5uUTVlrgGgvJ9PRB
         QySQ==
X-Gm-Message-State: AOJu0Yy+6Xk/z05QI/9BycpOxxx0yq8+HCJU4pydmm6QqITLhrDA+9f+
	V6ZDWGX8Nfse1Sl4PjT1ZPtk1mnMtm18a4OdhmUmPnesvCZ1eA7hNPGxCqqyyRojSMY=
X-Gm-Gg: ATEYQzzXQRUFDpQstEO2jWp7XBYbCkmet3Ib2AgMoRqn3BoLyhVLkE9FY/sbpZU8nSt
	AtZt/YnJDuVRuUtlFOZ62yL0e7FFkwoPuxB4LgffVaaUUE0oLJIeeZepBAu2BdGsGZnTwEyKvl5
	J/zWjLO5WdwLK2WP+hwVD/6pgJJqj/1wcRZcpJ8HlLtMocmSxEXR1MMQgWZY1+FFcNw9hk9jmV/
	uceu1Bxv0SWfCP8EDwtxmP1asguxeLblRZVkhAiVfbgYKoZVjfJW0GA2fqJOtugUAj5AGqhYOvK
	Nwbi8iiOMpoXYzON8cc+UoJ7wMFUuvzx097OXdRMlDYSVvwu7a0+3WPz9wyHo7hbeIr2I5WbTtO
	RBbyzG5Ts7rGWPhdNbMOY9ZNdhcZhR+36UCcmJTZj4ljcBk9a6wFDOvgeDKgJGReQu89Lh+/oSR
	8PZaP3zK3xr9lxS8I1EcIPylYhxMmo9sTK+YashQAf
X-Received: by 2002:a05:600c:8b5b:b0:46e:4e6d:79f4 with SMTP id 5b1f17b1804b1-48526927a4dmr139650865e9.15.1772986330688;
        Sun, 08 Mar 2026 09:12:10 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.98])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4853149caffsm37960475e9.1.2026.03.08.09.12.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 08 Mar 2026 09:12:09 -0700 (PDT)
Message-ID: <7de6368c-0b9b-46dd-a752-e063f88ae164@tuxon.dev>
Date: Sun, 8 Mar 2026 18:12:07 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] clk: at91: sam9x7: Fix gmac_gclk clock definition
To: Mihai Sain <mihai.sain@microchip.com>, mturquette@baylibre.com,
 sboyd@kernel.org, nicolas.ferre@microchip.com,
 alexandre.belloni@bootlin.com, varshini.rajendran@microchip.com,
 cristian.birsan@microchip.com, balamanikandan.gunasundar@microchip.com,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 ryan.wanner@microchip.com
References: <20260302142008.3253-1-mihai.sain@microchip.com>
 <20260302142008.3253-4-mihai.sain@microchip.com>
Content-Language: en-US
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20260302142008.3253-4-mihai.sain@microchip.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi, Mihai,

On 3/2/26 16:20, Mihai Sain wrote:
> According with datasheet [1] table 12.1 the instance ID 24 is used
> for gmac generic clock.
> This patch adds the correct gmac_gclk entry at ID 24, aligned with the
> SoC clock layout, and removes the old misplaced 67 entry.
>

Something is wrong with this patch and the next one. I suppose it's the missing 
version number in title as I cannot grab it with b4. Can you please re-send?

Thank you,
Claudiu
