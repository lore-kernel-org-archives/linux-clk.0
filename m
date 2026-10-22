Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792627743;
	b=331CyhWuihX2g9bIGc2g21N5h75I9dswlSd+PzUIQfCdt++jVKWIvpi+ArQbpb/mblOG
	 T89eMmfC5TR18jGsGQmNklooM+HRYWz9kdUiMPCPf8slzb5HWpxMdEtkbhzl4DEylBSRi
	 ZfAR/easpvAcSSrEUOpQEU8KdbjhRPHxThlo2HkH0dGShngOadHJ6sVWRewVqL25Eiho/
	 wjZhA4YzqN3tfyecd6RQ754oeyIN3cI/3gVioe5zSB5FQBxpjv9yRFIumeJCvtkAFUlr5
	 eUtRuKUuQcP5voqXbUh5x22le4LbUvXDs9lpVz1JsTsBpYlDZWvwGUldPyVWX8LMbgg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792627743;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=wotwEdh8TFdVFdbwz2jBQFukWF5WLCNBsDV31JlApTo=;
	b=4jbK5D/oecD/Q3SXFwkypN/DIGzT+gNwfSGBNkD9dywW3VHwnTjWLO5CEhTQa6SooaWi
	 mjMWHLy+hZw14yRCms0HP3rI/n0bYeJA8yMfP1kULtSLmSEz4Ut8rmeB3bSlBOZohmmES
	 vlRTWt/qnMWeMvAiyzrOMgnGR1lrj+URP6eDSwwMEIR+jsF3DtzVKbd8XTI4vDSw2M3NG
	 XMFeeKjZbm4Y1zZiSLL3FadaMoaKOyEhvieb9LbWXAnp2zNhlZlC9rCixB5HqZQDY8nO6
	 NkSr05KdFDidLNRaeKvq8hVn70bnrfXhFgGw67l76mjpsgnmMv9XVSQz50bdW/Qot8Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=U3tKwUOp;
	arc=none smtp.remote-ip=209.85.161.46
Received: from mail-oo1-f46.google.com (mail-oo1-f46.google.com [209.85.161.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14994606A329
	for <linux-clk@vger.kernel.org>; Thu, 22 Oct 2026 00:09:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 14994606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=U3tKwUOp
Received: by mail-oo1-f46.google.com with SMTP id 006d021491bc7-703be215729so548518eaf.1
        for <linux-clk@vger.kernel.org>; Wed, 21 Oct 2026 17:09:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792627741; x=1793232541; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wotwEdh8TFdVFdbwz2jBQFukWF5WLCNBsDV31JlApTo=;
        b=U3tKwUOpItPUVDK/iRQZIB16gYfJ2u5NmP57APeGAHsv+PpLy/6kpb1vSGGvhUmZV/
         5b12NKsH8MJJWxjWvprmtaLkZ62P+L/5xVbgNZX8XpveFUwJDFhIyzQOUjNpVSa4Qejf
         FNzMKgEih3/RZWlT8F6Hof8SdaFS2UfrvWIL9ki93kvklyayv9Ufy9RAM92uGP0GlzpU
         Pz30t4Hlbm+Xn9JCA6lchFD5yKV7ZLWwXDInqJwhC93NsK35CUquUCfatFR/Wpo0se15
         LzVvl3p2/eA+lT6+M6svE0XvLUTcl0wITxP7ih8OLNlPmzsPwVZBiZP4sU3jmEFyBt6q
         B5yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792627741; x=1793232541;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wotwEdh8TFdVFdbwz2jBQFukWF5WLCNBsDV31JlApTo=;
        b=DN+ERzbqOpNLLcbBwxlDAe4JygVOkfZ9OEWOdmwDRdwe8s2IcwCZGtYu5ChJsHs078
         Hnv458dBE3yWDet3sFXIG+CoMiS31uXsPwaMKEb1oXZHN7tuZNpQhV8YuKdcS3+lw845
         worzjyDIWZOcMXq3SlTXtFezOk86F5gwk41+Cfp76lEBJfq/Va7R8etes6kvPYTzUjq+
         RSMwluuTtOcJBsGZBtuxWk2fbGncIS2KANiYsvCHGZ2cdwf+XCjWZg5MyXugN1WyVgMZ
         cZQRbzu26bzqjaPNnOrB9iKmYzamTWjNjenyzBs0hK9O/mbWrUphvU1VjklEINDJoymv
         Y3oA==
X-Gm-Message-State: AFq9FYKWkZEVMm6MMUDjWOOGuv8SsKem2YVrp9eHN7p0AbHxlPslzdCM
	LLYXgEKrQzb8w03YCauB4gWAIFT6NTkTZn5s0MfDhrvGhGDt0pwMP/Sy
X-Gm-Gg: AYBFou1KYpMsUEpMIae7/Kx0e0JvZPPNzv/0QL5xmxh7DkAggWZDZ/gL2tRoeCThTM2
	3ykykuW4E4bcDKzkbJGeFvw8WijXzrNAOzEIO49SMrlPaR9yIcSCQhLGTYQC77kW1KYKkApE0Qs
	X/NSPaK+EPCLWrIgdvfDeOW6BMYNmeimiDeL483cHE0wWlURazwW6ijgWmMQpmPTuFsFbPhf9TC
	gXUQS7DNCCsFneFu18H42arritmsQhDy/LDmqV9uFgMGfsoh1gmjfK0eqMyStipjBkc+AYm97dr
	IFTPhqbrbVBX/0fL35ae5Hf1MGEKU9ienR65A3yCq9liAnkFn+uHGGmF4KYgxtgE3N6wn3wrqit
	SXzkAS4PrtASMAMk8jfyW/i86lB81MnpGBgpDRisszbIA7/dPEHZS8cLuAjd0rzdFea/kroTekH
	HMI1qBBKETWGcBdcp9CP450m1BdwTSlDnLrTW+8IYKVOzsscEX2ynGTAxTsJkeiiNHfnBUvpgJf
	eKUswlveSFF2vWMDbPHlWcgahkiaekh0sb6NniylqazR0nazdN6f60v4+f5FtwFwEpR2ioG1A7M
	0J9cKl5j5KAy/m61Yfql9tOFT8cqZESBZ1kILvrOI2gjJ7WfdQVI/0EtDk2fsMS5a804A8Z1OTG
	RaopTDzAXpTMpcg6Ahp2Hlo95vOombpaRMpdjloPhUlT4F0eSXJfKV/HkjtOkEAL2aJOU0n+WmU
	ZvYZk=
X-Received: by 2002:a05:6820:1889:b0:6de:aeea:5c90 with SMTP id 006d021491bc7-70940d7dd7bmr2299772eaf.26.1792627740866;
        Wed, 21 Oct 2026 17:09:00 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-70903bc246csm3281362eaf.10.2026.10.21.17.08.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 17:09:00 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 21 Oct 2026 18:08:56 -0600
Subject: [PATCH 2/2] clk: sunxi-ng: h616: drop the private APB2 clock
 definition
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
Message-Id: <20261021-submit-sun50i-h616-apb2-clock-v1-v1-2-7b857ad1198d@gmail.com>
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

CLK_APB2 is now defined in dt-bindings/clock/sun50i-h616-ccu.h, which the
private CCU header already includes. Remove the duplicate definition and
update the comment describing the exported APB clocks.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/clk/sunxi-ng/ccu-sun50i-h616.h | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/clk/sunxi-ng/ccu-sun50i-h616.h b/drivers/clk/sunxi-ng/ccu-sun50i-h616.h
index 7056f293a8e0..8a07c27c77d5 100644
--- a/drivers/clk/sunxi-ng/ccu-sun50i-h616.h
+++ b/drivers/clk/sunxi-ng/ccu-sun50i-h616.h
@@ -40,9 +40,8 @@
 #define CLK_PSI_AHB1_AHB2	24
 #define CLK_AHB3		25
 
-/* APB1 clock exported for PIO */
+/* APB1 and APB2 clocks exported for PIO and UART baud clocks */
 
-#define CLK_APB2		27
 #define CLK_MBUS		28
 
 /* All module clocks and bus gates are exported except DRAM */

-- 
2.53.0

