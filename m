Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793844570;
	b=muCGvJTJ3gZnvC3uJjIlMbZXAljyW09bij2o3XRschPTwaVFQIkcO5FRR9jgQJbiO3v6
	 92BR8u182W9FKfMsRLsoh9j9eTwM57dn1F0qoP05GLsfPul13IDLceg+7YQ7HlRQsdVJh
	 SOsPfNXYhJUchDHtxwfcxYo3r/ZFd80Ge4J0V7DHlw4LWQi37Ck7m1oo0YWlN+8lEkRJX
	 4n/ia7GI4HIsSRlXNzKGcs6n5Od7UUHXcXnZ4BcW0Nya9MClLM/X/324lxify4bs2rMCf
	 RK0vBTQ5bcOl+ZjE3nmwXksNT2W8rgyDKt6P15MfvzSDO0TNYWltR9Yz+v2wksaC0mQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793844570;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=jDAfiOlVrfcIrnBYrikcNDpkrwfsc7W/pzfCEuEFbJk=;
	b=1ey3/OiXTv3DJSxNoFl9xFb4SSRF+BIFw++KqSXS+BCPdJC8aJWm/3fJk5Hvm3Xz+YOJ
	 N8YETUBaLG+WNfLgY39e91qdMB3bNSPiUh8kj6MDOEyDvvc/EIxmCow1vwnMHOSefbeOh
	 Rl/90FvOd96AaIMWMc3CKYVER7fGjkIu/DMnuHTPUK5xI0WRZhx3tuscKs25x7fjlPqZq
	 jhXw2ESuw57uVgO3kbkaPSa9seDDjZKffJxUNjQCSKHLuHPxzSIpijRNdh6QbEaXEp4Rt
	 ofRscz7yqCyjf1SogQywb/rOtLj5kZHrzZvkY7A4syxGHl0qhXAsyoQqGUobGqHiiow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=riscstar.com;
	spf=pass smtp.mailfrom=riscstar.com;
	arc=none smtp.remote-ip=209.85.210.54
Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05CB0606A32C
	for <linux-clk@vger.kernel.org>; Thu,  5 Nov 2026 02:09:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 05CB0606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Received: by mail-ot1-f54.google.com with SMTP id 46e09a7af769-7f84a55cc06so910456a34.2
        for <linux-clk@vger.kernel.org>; Wed, 04 Nov 2026 18:09:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20260707.gappssmtp.com; s=20260707; t=1793844564; x=1794449364; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jDAfiOlVrfcIrnBYrikcNDpkrwfsc7W/pzfCEuEFbJk=;
        b=bQKdoPaYIBZlncDH+3xR78NU4SZUy1UNzYe4/3iE/eTtE3fc1boBVnfn1qAh43yNoS
         Yv5rHw9B+zMsENMqNuSO21592z1vYg7F1Vb1HUPUBdPXtD9BbCv+q2xYF/6n43abhPLo
         P28bN+i/ukbP2L97wRtjJUFA2G0hg8hcmztmrqIfwwPIm1DkyKgR834K4zCUMjXKhssv
         TFNluPBDfBn1byhqxr1I546yDOtxyARPVZcWaXqv3T7oHOf591/5YXxH8guy8TAXg0pt
         z3lGong9nI1CVZqT9ZnY7VtfMLaXAJeWRqjP0GKbqsphQ7oy+C6eiupBdbyjtT9Qatro
         W/lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793844564; x=1794449364;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jDAfiOlVrfcIrnBYrikcNDpkrwfsc7W/pzfCEuEFbJk=;
        b=DZGiqtEuh1Kkkp+cZS3kyZi52FHiPFg8QArxHowHqrO63IC+TeEa3nYp7ue7/HjBxm
         zXCbmlITDtYqjzCHo1wjhIkqlCPlkFBiCOlLNCdkiW7gLdMWqfQ0Lor3OUVJTlsTu/sv
         Gh6hYKew9HFQFQNJfkAcTcKLrl9kIQ2M+N4lbirevFhvwe/K7Arxj6wxl/873nl/3oi1
         YaCZgoZDRH+fEKkexCkGUUW2zLncTxwl/xANziQ+0hBHZPT99oCf8fKKpuxgAzShoXtr
         JxoBnmloZf+HWOJ3+NMv4elkB1UJQlwLVUbNrtEE+Q5gIutG+Ejzto9WBMlyZGEyWs7q
         K7og==
X-Forwarded-Encrypted: i=1; AKwUvBwq6KCwAMgCNuEUtlfyKEI1Bq6RDhf8yLKzq1ro3F8g+LuJB+fb91wiw1fSjLrkfOLAxUk6wLh5Pmc=@vger.kernel.org
X-Gm-Message-State: APuU4Z9vWuIpz/3LElR6VPiCbvDw19Q2iRn7oFf2C8QOLhY2AWx49PC0
	4Xuq8UU12fpSS7FInp/E+Tb0oNbIjP8n6xt+l1MQ9vDbAOPIlFtwIgWqhkOxd70QJDo=
X-Gm-Gg: AYBFou15UgEG7+cgYXib2D7z6O0onyi1tsR6fQTPSy1V4/8In3693XKOzFOhqBR8cxT
	u8XdF5eNxuBSF3kgJ5p9FWxGshVn4vGrG1grdmctg4pUgXZcsa1gWcEL2DsxuofD/pWeGmaz8eF
	+lp0VGq+FvXW5t0OWxuQ40nqpjz7BWl7NLe8/gOKPBia6e9SGMTU5owNHkRuvZMQv+G6H+cpTi0
	C3kXqcG+joPrEnOSWSbA1m12FYcci0pQlqm3Jt5Gud8usQZ+7tvLaH/a5vmGbrq/1v2miYGEfGa
	Ogaw1AX2C0bQMS6FL+kRJs2h3doLXERNprN2EM8FTG9oFU2S24CKdvUG3lJKGDHDnj+SPSW3yue
	i+05MSTf4FyXzkmR++NoOW3yZIc1FvHR55rDYbg+qeX3tLQ+qfFE43iL5Huhjy/m7qwSCewkmau
	2fj29oimqrzXP4zcHLw4Db6JUANLlJTVO2ntptSCpxJVZFdUOhsFx0OnyubivfhBr/CYdXyIHW1
	mU0DAde5TQlXlFmMF55mqJTJvRys9BWLxc/3LJVf/LwGQo+S1AV3CuaTTUJ+NzMil7VY/aTwzdC
	VnSbVnJUp3hQptMbdx/ZXUH6mXyE7A==
X-Received: by 2002:a05:6808:11cb:b0:55b:f88d:6ebb with SMTP id 5614622812f47-5640df0a2eemr12633362b6e.54.1793844563998;
        Wed, 04 Nov 2026 18:09:23 -0800 (PST)
Received: from [172.22.22.28] ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-567a9f9115csm3235689b6e.11.2026.11.04.18.09.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2026 18:09:23 -0800 (PST)
Message-ID: <8feef6c7-df8a-468f-863a-fb2f83c5e478@riscstar.com>
Date: Wed, 4 Nov 2026 20:09:21 -0600
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
Subject: Re: [PATCH 1/4] dt-bindings: soc: introduce
 toshiba,tc9564-config-syscon.yaml
To: Conor Dooley <conor@kernel.org>
Cc: sboyd@kernel.org, bmasney+clk@redhat.com, jbrunet+clk@baylibre.com,
 p.zabel@pengutronix.de, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, daniel@riscstar.com, mohd.anwar@oss.qualcomm.com,
 lorenzo.bianconi@oss.qualcomm.com, fabrice.gasnier@foss.st.com,
 alexandre.torgue@foss.st.com, marex@nabladev.com,
 changhuang.liang@starfivetech.com, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261104004332.2141282-1-elder@riscstar.com>
 <20261104004332.2141282-2-elder@riscstar.com>
 <20261105-irregular-awaken-b329b9c37e70@spud>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20261105-irregular-awaken-b329b9c37e70@spud>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/4/26 6:28 PM, Conor Dooley wrote:
> Actually, can you mention the other features that this provides - the
> service it provides to the mac, for example.

Yes I will add that in the next version of the series.
Thank you.

					-Alex
