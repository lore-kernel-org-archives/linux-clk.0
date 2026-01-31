Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CC45126C02
	for <linux-clk@vger.kernel.org>; Sat, 31 Jan 2026 11:02:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769857333; cv=none; b=so8GolEDctxuVltU9z1KnBWYIYvif+HS3w0HIgdObERk/6BAvn1si7lOzVZerKrDgPMsQ1tX+7hSRpjZDR+MG9KDk4sjnpu24vmJcM/02dJDSK9qa8fQBuGswzKWSUu89HDvabqMmcwQhUkMiucMHhTgWp4jq7VXGr97tsRam+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769857333; c=relaxed/simple;
	bh=fj/SKfFaUKxTK0jWA0hqHgEId1Nh+jOTR3mW2375mVU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Fe48SGfqcc38pGnhjagwn0uytq0UAjhK+d0xn3XMn9yloJGR4wqAfxx8Oi5nzO2N9lqVTaTOHdCcqpSPHc97gsPI8BpBbvRKlW/f3YXOsBntIF+YTdcg2PKVlriX/JUs4k2W8yzOnQ1PLmVgahGVH/oaF58LRXWDgxmE0OIsP8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=Bs3ZwbGF; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="Bs3ZwbGF"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4806d23e9f1so32430115e9.2
        for <linux-clk@vger.kernel.org>; Sat, 31 Jan 2026 03:02:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1769857330; x=1770462130; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tmuSv2QmfBZum+GcyEyFfTktPLozfuoPR4C1tZRIupo=;
        b=Bs3ZwbGF+1gDXDuxHsF8DGOlhl4lnNsAPVSkMBwlCHndrmtY0CtO6CoDtlkDaf/wvM
         G/fkW4LmQKX+4iqbF+X52nK9SiVtaBC98Qp6cGKRDi7PaD0VxznG/nTE0+tcMuP6Xh0C
         G2B8O3128/PqPrvl+BP8b3bCZiwyFjbSr5qRpGcUeajcURdn0Dz/QXmBS8XD8UOSGcOf
         sNlxdDyvc4oTeFJd/+SqrUAYONAXKWRk8G1/3B3EhhDRtbRV5OAtLg34U1Y2KNlXTfQ4
         eWn0kN6kYdTNe4guommUIZtFqqLdCCA2lIS4o9gk6zxhpROHvq+JKzAIIRC9TP7lK8FX
         xu5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769857330; x=1770462130;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tmuSv2QmfBZum+GcyEyFfTktPLozfuoPR4C1tZRIupo=;
        b=Z5wU6fqJUk4yE4vaWjbsErNL31aPHV47MfO5h5HxBYMMeOInyRsnruXlTXuwSS9I/m
         0y5DJCnc+MXJIuY7gbNJtLaHIqS+JfZW7NFmRjUCLpTq61ahdsaLMQyQfhyDktwmZZtf
         IO88HiXis1V5aHddO3Dq3bsEericNitmxb/OV2CcyKgMOUhXMLZk2gKO6xz+LlH0bZeC
         BL5r+1TssSdspPvJAYyWDLWknGpaR4VpQx8Z9fhbxCEwONdTNXzdS//RNwHNBX+EGB8Q
         DuU4r5sMiqFc/uf5lzMqKLRI9qBe0Wq7DnuGvDcVMvgcX1/iwKqIdetIc8sF0ICuNk+X
         HXug==
X-Forwarded-Encrypted: i=1; AJvYcCVT3pIflETGLks66M9/Pui3fbGsuHUb4SrT79SZGXjIvUGmJeESxj8OLZh8n22da06F9daQ1WIKrNk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzJafKKVOvpZH078W/7070EeWTX3XZ7qQ1Imq8JK/Q5hXa0xoUe
	OVaiKQNRk+CK0+Wvb+iohLgGIQhf+uN6LamNXPODF+8W7OeNkfAq2ghI0P82brduR0w=
X-Gm-Gg: AZuq6aJX7+NexDlSsymCdP0FShzsE+9Tq2sD2Kowu+ng1/b3rQHi3ylmoqi5bmGrASJ
	ClMhwgKmpKGfHdlscR+lw/BWUUFPfU2iGfaHpFJVpVYAvGJO4PBTzaZ4DE1aaGeNb/p0vgdz4e+
	uW1GNCaa1vTZtgWy36vCPQq/KumiW1bpQClr9MiHoF8p3pDAh1Er5KRoPi+m1ZVbk2iEr/dFLpg
	UyKlzf8n9FbRl+Wu7RVb1d3kfAdyCU1ZAZSLfJSaaK3rY0myzRpe4rV/B1o2jtcJHsxKFEMDdBn
	tpMg4+ns5bdbCi0MYiEVSuXFov9m3MBdhLP9fpCBgHOHBcYNIY82w3hig2Wnll2a1We7EU22Vto
	2F5h1G1vHkI9GsFqBHc+7Eey7xyY02w15IUJ7bJsL2kPYttzVG0m4r+lBuBruJF9kSIjTeoL0FO
	2JZqHXOZ6mUBBDd33VoWMIAs6E53Lz78KMk90=
X-Received: by 2002:a05:600c:4ec7:b0:477:8b77:155e with SMTP id 5b1f17b1804b1-482db46b04fmr69444905e9.15.1769857329727;
        Sat, 31 Jan 2026 03:02:09 -0800 (PST)
Received: from [10.100.159.246] ([213.233.108.212])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4806cdd77b8sm257266965e9.3.2026.01.31.03.02.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 31 Jan 2026 03:02:09 -0800 (PST)
Message-ID: <a400a729-7176-46c3-ae08-d69cdc3ba3ee@tuxon.dev>
Date: Sat, 31 Jan 2026 13:02:06 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 21/31] clk: at91: dt-compat: switch to parent_hw and
 parent_data
To: ryan.wanner@microchip.com, mturquette@baylibre.com, sboyd@kernel.org,
 nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
 bmasney@redhat.com, alexander.sverdlin@gmail.com,
 varshini.rajendran@microchip.com
Cc: cristian.birsan@microchip.com, balamanikandan.gunasundar@microchip.com,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <cover.1768512290.git.ryan.wanner@microchip.com>
 <a3d52e30d624ba3859d9d3ba6fe8b8194b833c83.1768512290.git.ryan.wanner@microchip.com>
Content-Language: en-US
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <a3d52e30d624ba3859d9d3ba6fe8b8194b833c83.1768512290.git.ryan.wanner@microchip.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 1/16/26 22:07, ryan.wanner@microchip.com wrote:
> From: Claudiu Beznea<claudiu.beznea@tuxon.dev>
> 
> Switch old dt-compat clocks to use parent_hw and parent_data. Having
> parent_hw instead of parent names improves to clock registration
> speed and re-parenting.
> 
> Signed-off-by: Claudiu Beznea<claudiu.beznea@tuxon.dev>
> Signed-off-by: Ryan Wanner<Ryan.Wanner@microchip.com>

With the patch description adjusted as mentioned previously:

Reviewed-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>
