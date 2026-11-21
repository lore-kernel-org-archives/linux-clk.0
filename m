Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.175
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795285414;
	b=Our/S9kbtQO3Q2NDTrGi1ljEWykmyHzZ2kfHq7OBXrcCu9t3KtG5LOJ8anX7GuDbNFjt
	 bGnONrg5PtvGrATXrtgHutrm6SpoYSDQD89YBFD73uqvNruHdrpbIGSOuzzKC5gHXKW7D
	 +/A+OJUvfAXFBznMyGmUIRRpIlEFmsRkucSfj03dhhI1TgAG6hqNrEwXMcePoq2lcriB7
	 XketPSOGZsFOF+YVejwpdbvDhyvrbfOndVj0DxUa7dDtf7KoXNA5Dr48yag9v2wtvUVnL
	 0wdIUkMtAhjUQLX92VWL0Q4Qy9+co/2BVzZIUuPluoV8FYhw2Ae50q47q2she3WzcUg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795285414;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type;
	bh=Z75xzDza/hooSCAJFqk47whifzAJZg7dX21ijDhOozU=;
	b=UkWpRamlTkGsmg2ciwSLz26vwAw968hp+ac/1oLMfwRlaTWa8B1AwrOVrgdewhSFNjPl
	 k8cSaz8f7w9U2szs0r8oVOHp+6lmgWaFkRji+iTYLo+Dm6z7Sc8ZTcoynP1LZ4BbDbkF3
	 zrQ8bSLbz0c6WFVw8fG7ENGrjmuxNJWOKheF7GqIp6KuLoXITAf9EHgsiWUFiZPlG5dBQ
	 Re+f2K26sh1mlcoWdzU3/BuB63HMEgHrDxoPGwS6hxUvO4EVK6MD2UkioKnvEYGGmRRj1
	 Daemey0Ul7kD6/rRYsgzTQHyZoS0YUclIz1Bg4MnKWh+kiAKbkyC2pwyQEc0FF88XHw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Gna8eCKj;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.175
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E45C606A320
	for <linux-clk@vger.kernel.org>; Sat, 21 Nov 2026 18:23:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1E45C606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Gna8eCKj
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-3acd239776cso16555431fa.0
        for <linux-clk@vger.kernel.org>; Sat, 21 Nov 2026 10:23:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795285412; cv=none;
        d=google.com; s=arc-20260327;
        b=Uo4Cf2pFRmdLTy/ir4cx1xcU7TH7xwQs/G0qP772X2QnFnF0ouuDQtRyzOCGnMPi3y
         JIRBvc00Rq0EY+dF7yEvfoBCxikfNka2jnt404+Nydbf/+reUl24aNHR+wq/lh0IRW+u
         o74dCJBMIBK3fjKQFuuPnfuMSR+FPB4V+b6zNkdiiJA6mf5n0LCOmhaNjUFMjxCyb7oA
         uy7YAFU9avJRACYzMICn6+n9jD3xZbOf8E+QC90Ujwhh3olviYcZ0XjPaWJ5TQXhqH/t
         tBaVE9baie/G6zDPNS0jthBcsjhxhW9RfhbMTZN8mabb8Ia6XvndPQzzKYr10OgfoDlQ
         iJxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Z75xzDza/hooSCAJFqk47whifzAJZg7dX21ijDhOozU=;
        fh=fM4ZI8+hWSv3Fnbj2b8tQ4LUMCJe/yK27MRsZNxqW0A=;
        b=a93PEgtPdQHv7Xxfa3zQ076aKOzCUnA5CaiDQTGJvfceDD590Pk/6pW27kwoB0h7CY
         U9yJ8V1flTnbwgu3M2rq9nEY77thAhLZngd3DQ5i874wOSofvHo0sUTxHbCHGjky36jd
         /SafFwuPBZ4Tvq4VlBSOJy4KgJacFBWAAvFKyWnSWAJAJXP/K4aHXTV8fMsnhePfsCOF
         OnwvVLjN6PelMoSENTDxFq9uE5IYN8EWzFtEBvmoGmpO4lX6yEOnBm0R+7rcP7iayi1s
         tuF33AqK1jmnLWHx3WurfR6a86z4asEFJ1deosso30DPRXQDqorhx5fgraiAgYHwFTjX
         RRnQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795285412; x=1795890212; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Z75xzDza/hooSCAJFqk47whifzAJZg7dX21ijDhOozU=;
        b=Gna8eCKj4n5Ztoe8pGJ6AHQFClfP8pDbk8gPP5tkIswErA//AQeVc0sV+av3G8VsH5
         0VKreHXVNyPDCCWr4bUgC/yjw1AhXXhO7ORi2ddeCdbU1KgNb9tby53+wNzQZq0wrnW6
         SXfKTAudT/9bQtLHL415mqsBtTo9ly0mDc/UBUYDkXXt7jiuAskwtO535wUF6R1mcqX7
         HojVbacJhSZYLi+Njuupk3hY5UCTEDuojXatBo5yPXDfLRLFYfAAwwp4OdQyaFfgYcVG
         LJ4ywBOUxynyNAzta+xOSjPBIoZ7PWKREo/hN/hTFezi+1yXPAlp1uPeZy2UTnXDKazu
         4hBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795285412; x=1795890212;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Z75xzDza/hooSCAJFqk47whifzAJZg7dX21ijDhOozU=;
        b=TYOEO9jdEnpUApnSrVMOVyAwvPvzAXfUdoybg0K+Jq/34q13WG6UKI544+UzVMMcsq
         4ric8uC5rPt1Sks169R8kzUWIgpmA2scnAIPfXEQK5OW/dM5aFON7pqPkfHIczGF8xAR
         RZc+dJWzWsxXVRGzJfh+D8wHQM/A94OiTtC0lKIB1VuKQIEY12mTLGHRmNM+OFW/+DDN
         dRx89YY3osx2WXTlzOdI/qtLJa4LWAVz5913LLItSggYyPFQFnA8GXK1oMDzqDNO/FWt
         G2jyB8wNQNZ56eK1gmey+OaUSEYiJri0+k19Bm9BoRM9ecSo/cPxnXjpx1a0OMJRmBf0
         Xwsw==
X-Gm-Message-State: APuU4Z+D6sgRdCvXYsIkiNe9OrNISAqsPAvvKUCBEg9IRovtml3c4XIT
	CO0XnDYFGL2v9ODNRWa5B6G0jAlPFIGQglJWyswEbzN1qdB7GieplGs6PFfVlOsT06P55Mu3IH1
	90lhF9hqlg3NTwpMq8OGnCF3rqrlySvT6pUToJqU=
X-Gm-Gg: AZFdTZfpoMD6YzOxp8KoMJC8HuFYYLa/lUYMRn/njAlWqZkoA7qqUOcLKcfh6ZCh4Sh
	fEfj6GEuFlqmlRkcnRofdMzw3UVYWlbwi6QeOdfOACS4Z7r2Kk8G12c6OdjGpk6idYb1dINra4H
	bVGisWeLQD/5te0/AXQ6zgQKJDQdzlDsjRle7cCZZSwsyQa+KTYQ99ioWFXzoLTkKrHQtRl9Qne
	cMERqvh7j/Ehi2mMk+yW97cp3ET3OI878cuvtTwIBYT6tuPPdYW5cGA68ufq0QgPCW8gYG/702B
	PWk0/3rA+SaMgR/VG2p/eeOq20NXLjLYm7cVxTYMG/uuDpyCJ0ZGHBWl5srvtds9WbZz3F2Ybkq
	SKPFHXIPjIfh4WPcSLpZZ95h8VOt7HHUX1A==
X-Received: by 2002:a2e:bd06:0:b0:3ac:e4cd:d824 with SMTP id
 38308e7fff4ca-3ae7fa9d43bmr17398791fa.25.1795285412132; Sat, 21 Nov 2026
 10:23:32 -0800 (PST)
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261121163915.86681-1-joshuacov@gmail.com> <sashiko-outbox-227181@kernel.org>
In-Reply-To: <sashiko-outbox-227181@kernel.org>
From: "Joshua C." <joshuacov@gmail.com>
Date: Sat, 21 Nov 2026 18:23:19 +0000
X-Gm-Features: Aa3M54oMS3zDmX2jTIQjP60yw_5F2PR36ANEnn56lHMZE1_sztKVGnLssNfJp44
Message-ID: <CAKL7Q7p4C_Lmpa7RE=ERBVRzynNGdvhHMWzsvhe_ZC0v_0s_1A@mail.gmail.com>
Subject: Re: [PATCH] clk: rp1: allow the clock provider to be probed again
To: sashiko-reviews@lists.linux.dev
Cc: linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> Clearing desc->hw.core and desc->div.hw.core for all descriptors before
> the registration loop would avoid this.

Thanks, fixed in v2:
https://lore.kernel.org/all/20261121181650.143474-1-joshuacov@gmail.com/

-- 
--joshua
