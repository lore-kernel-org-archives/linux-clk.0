Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792627741;
	b=S4AFIIjTZWHb39WHnEpD7f3mBd/KO1PJW1I/z+vHjGNlaQkfy39QbRW4QBPOC3km/CUg
	 Bh6VH4N5WsZzfroMhv5qTK/YtsNtSxHCEOIO50Yez6RSAkBS4FAWcGqJ2ZG3hlds3L5lY
	 gG456OXksCHMo+PyBS3KvZlp+wgBgV1q//p2upi0ocYhrjhB3Lmg30TnbFWumWBAc+gpa
	 7ylt4xHzkZirtf3pQiZ2j/57yUlbzgwEoTNNEFfZvqAJtfzK7TngTKFF4TT2UZZG3TqeT
	 ci1seClYIX95BhAR/pAcrMshkLVSkIS4EFs9ZpfRVTWBlaNWZGp7O4GsvkmaDornx5Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792627741;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=xX8Jeb7zcqlanRR5cQP8+zZOGl1Uky6hdK7k0PUYqPk=;
	b=jQKAub3GGTGAvshyMDRCIRg990+ElnFy3c959gvXvocxMcUYk0pkel6tS2/6+3fM8ywM
	 c1GZFHi3q40ZTS6gKXg8v0gUwgD2wL6aETWuHnELUz4dj+UYMlgPQTNHwBwL+8Camr/Nv
	 JMNWQ9eQG7BQD5YhD4z83verv50pXjKAx8R1uoobym2SKgMdKq3BcmfGlwIxiIGLDRB8V
	 00kU7iFuYxUTCZDpCWfUesAwx68Ls9EhiLvjCE2MxZ1O1Aqpv4CwStVh6tvg8ABK8pTMC
	 AFW+kXNULHVL3EmmWXAVkZBP0hsdnDYrymhuZYoIufK4/iIQVsQSM/kTMX8eeks5CTQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=reit0VCT;
	arc=none smtp.remote-ip=209.85.161.54
Received: from mail-oo1-f54.google.com (mail-oo1-f54.google.com [209.85.161.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01D88606A320
	for <linux-clk@vger.kernel.org>; Thu, 22 Oct 2026 00:09:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 01D88606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=reit0VCT
Received: by mail-oo1-f54.google.com with SMTP id 006d021491bc7-6d7e06dbcccso837153eaf.3
        for <linux-clk@vger.kernel.org>; Wed, 21 Oct 2026 17:09:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792627740; x=1793232540; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xX8Jeb7zcqlanRR5cQP8+zZOGl1Uky6hdK7k0PUYqPk=;
        b=reit0VCTG1Vpg4NoFYSmvQilri9kwFU34qIWBGtDhxaDbLaupjp78sIDf4v521V2c/
         dA8K5BiKMLZ7K9OlRoCXWicPEy60LgNasURMqTeLrKqeZz6ZEZG1agJMpVTBxU1LecWo
         tSLxha4OrV/m1JltHLUqvtDlnEx5HGApgiBoHlKBDwnhZybyL298+SL7u+aSod2AkGA6
         nmO6P0jTxxawP8GybM9VR4GIBB33nE051NufgnU118U8sPcqY9Ai9Eia3zzIua28+E5z
         /JHXFVE9lFER/C3LXp8FpXf6BSNs7zjM0B6E2M8IydE2islhD8PFfqtnMIFqvuaSYd7C
         ZE3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792627740; x=1793232540;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xX8Jeb7zcqlanRR5cQP8+zZOGl1Uky6hdK7k0PUYqPk=;
        b=xzu0+9kUwVWR/OGuzRKAYIl5Z24ezhi4B8GOAFrT09sq6aODBv+BDsW9+6PwHwr8UN
         /vqr6YHdbCy6eM1HR8+l6dCZLQ/3ceN/xfZ9iLHuFlCl48rF8ln+/kCVg395iwFJiKhs
         Kv15+JzplnRI4+Ck9D0rly0Bn/IGk9pUTtHzdZUKosEmBusaSftqbnnqVSCu733jlfIb
         FU1aDxdDp1xFZKtKlAuf+F6IcUOQU0LOMMvDKLAUgr/9+fB2TNIkVQZDk5V5gn3R4v1U
         gy86O/p7Bb6kRgXh4JwmqvrmeWeJBW5mMFgwxA7FJoTMbwr2CAvn36NctSjUHNpNrcYc
         STZw==
X-Gm-Message-State: AFq9FYLJP8hqZ3kNoIbOtV+DJCAbo1YA5RYEAq/962tInJMVMK3C4aVW
	RvNlxCtoI4+WQRsNK5RvodVvWj4IepR8yEkvOEg/tZI6UUaUmIHLf+Bp
X-Gm-Gg: AYBFou2mlmBrxXfYcrGW6V3qPugHK2IZcHgPhbmKOFuECnBOlZ7CiBYa/Dz62KSFFLe
	OscfikLxo/+UKEYQVHAxS9VjDEuaihBi4lrvT7NgKzAh5BrWtr2hgFHJeIHoRNGQrJ8u9tsjm+I
	pT5ofkur5kw5CmHZGmbEF2DPRhGerDu7szxBMhG2S0TKzkpIipHy1hVgqQp5kHwi35XygXnZFTN
	JVlQESbri92/yDmgMl6RJqS80iz0r5fu2ynXNLzWzUZoKU1yDyY639k2q1ufFwVdLXx3Luu3/uj
	EbIvk/iDTtR3AqfT+BeoXZwMW/U0mZflW/gEHKJWMosZNE1RL/juyfW4p1HpQVVtq8SS2bhVDD9
	k2J05tFbT6ffJgttZoVXGPRrRvHAb+i/ARJ7CPQI0iT6U9U0VO0Ez6CmH1GhORTgWnr88NLYuST
	GU1pmEfHJBENEGWaFLVBBbhTBS2w0QrO+nQ9kitNEiAmDPontvoLlTTkXXcUhLGlf0ciOBeeBHD
	Y4XeayZv9rU0jNdobXsJpPE4W3emoGWgXO3M9Fkwnz96BAhmxkyn3ss2n+X35PxF1E6G0TVqx0n
	zXMtGnV5VVSDCET6qFO38a/U7e3xjVCYc2lGUSYNavqNkvyjUxAzVrL0RbT3UX8wsrz/NglAPCZ
	jxuAuS/h+RuAksttciY+kZkBqhAamE2yUkZ9mMyPymMD521q24tz9HLSj/msYh4TuclEA3Zwol+
	Zb
X-Received: by 2002:a05:6820:1994:b0:702:ebe6:8009 with SMTP id 006d021491bc7-70941a50572mr2245317eaf.89.1792627739394;
        Wed, 21 Oct 2026 17:08:59 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-70903bc246csm3281362eaf.10.2026.10.21.17.08.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 17:08:59 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 21 Oct 2026 18:08:55 -0600
Subject: [PATCH 1/2] dt-bindings: clock: sun50i-h616: export the APB2 clock
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261021-submit-sun50i-h616-apb2-clock-v1-v1-1-7b857ad1198d@gmail.com>
References: <20261021-submit-sun50i-h616-apb2-clock-v1-v1-0-7b857ad1198d@gmail.com>
In-Reply-To: <20261021-submit-sun50i-h616-apb2-clock-v1-v1-0-7b857ad1198d@gmail.com>
To: Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Stephen Boyd <sboyd@kernel.org>, 
 Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2

UARTs use APB2 as their baud clock. Expose its existing clock ID so device
trees can describe it separately from the per-port bus gate. Keep the
existing clock numbering.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 include/dt-bindings/clock/sun50i-h616-ccu.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/dt-bindings/clock/sun50i-h616-ccu.h b/include/dt-bindings/clock/sun50i-h616-ccu.h
index 6889405f9fec..e3318772c92d 100644
--- a/include/dt-bindings/clock/sun50i-h616-ccu.h
+++ b/include/dt-bindings/clock/sun50i-h616-ccu.h
@@ -11,6 +11,7 @@
 #define CLK_CPUX		21
 
 #define CLK_APB1		26
+#define CLK_APB2		27
 
 #define CLK_DE			29
 #define CLK_BUS_DE		30

-- 
2.53.0

