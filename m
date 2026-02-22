Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4148360748
	for <linux-clk@vger.kernel.org>; Sun, 22 Feb 2026 23:51:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771804288; cv=none; b=hlF88/u6Q5oDP0c8vlHzMMyHZqYENzC1HdcBH3XahqzshBxCAw4J5l/FbpQ18q0YWQpbZ3PLMPbseifXNUGOgDIlDAfbr4NGqEqf+RTsNlj/T3dYMzYB4xvUIpbdTqWvyDVG72v0oz+jC5itKrc8AcFHI7/0I0UlK5lOPTMb8x8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771804288; c=relaxed/simple;
	bh=CJrk612FhmjDj3VPD/9bUWPYLrlPaYeOFopd1zExvM4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=a9gjTv7CAoJy2SWML4PKUlK3C01mQ8Q9foOWimar4D4wzOvI16yGXnNfg3bF5N3NjZXrM/K25nnGMci2bkqvbI/Fln6nG8Mwwj8/YHGgrXBOq8KMT8j4v0a0veFnKBM6mK8hy+0jGofSEo3JGK2iQQxcYq+ZELkjo/AdpG2vc6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=NTxF1tni; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=I0IApbXZ; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="NTxF1tni";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="I0IApbXZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1771804286;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ByAYkrfBSiLzcdOcDwRXDw/exNoypqVtDNBAFQcjrrw=;
	b=NTxF1tnigtMywL6RRM0RIV9XZiXE9T3MFi7li04DzLmrTAiqVshQ0LjQ7G9XEai8LBHxUi
	DU8bhEcUghng+nqQOorl5guLi8D9z2AwB/Cd4Gw+MgNzENF9LbadMVawiKxlmZWnEPuQ8F
	9zQ1t1LWF1NXP7DC5vBPQ+U7LLheXGs=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-252-EGOQ2zxUOjGOrghCMxpAbA-1; Sun, 22 Feb 2026 18:51:24 -0500
X-MC-Unique: EGOQ2zxUOjGOrghCMxpAbA-1
X-Mimecast-MFC-AGG-ID: EGOQ2zxUOjGOrghCMxpAbA_1771804284
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-503915b0a88so67384641cf.1
        for <linux-clk@vger.kernel.org>; Sun, 22 Feb 2026 15:51:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1771804284; x=1772409084; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ByAYkrfBSiLzcdOcDwRXDw/exNoypqVtDNBAFQcjrrw=;
        b=I0IApbXZut6/gK+NkFoFjCi/wBcjveJAOm1gdzm0nTo08vw1HJs1QE/Af/w1z7AhCp
         RPAP5YeDjcKIfoHHI6JRkdwOzYOxxg2vX5rJujCDAz1DJ0BM6+qDa9Iu00opUu/o6lLW
         8aET3j1qxVVd4FF9b6Fyai1LlpRYTEpAZQVLtVg+1Jwiln0WcmL4pMo/PNlw4c0QFcRt
         RXBEzNWaCcTxwObHx7RBmHoxxGYJ/hBhoW5eiN/Y8DDDvLeIFZxLOddFYUDV0mkWBcv3
         UU8bI/VZlVRmuEtbyLJyHckLcPW4kyBX6LpZSf1KNBGvwTziTM+qFrz2JmQrj/UDNrf/
         oR/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771804284; x=1772409084;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ByAYkrfBSiLzcdOcDwRXDw/exNoypqVtDNBAFQcjrrw=;
        b=Lqc5jgplKXoBcBWDEvtOD9ZbSqlFy/DoaH2mBGHfkx9sTRxSC9cuzetwzNU5BBRiY5
         bsduZFi+9QG4TW8D9/p2Br1N1Me+nC6cZpbjBwsLKyuOzuzTVOQ3COEYRVLHutaoJxv2
         hFy+B+D0tI1FGy04TwEBouPAUtTf5xjNXGXa/eIeIONtq82YLe2wW13G26gqlXOHB7Q8
         YviIVHl0N4ozB8DR2ACirI3SXE/VSbvB6D+snXSeh+5OCkqipuR33ciEpjjh2zhssVJk
         k6aJ3VUdU40mOENlyuvgbqQSQk2xcuh77B8Y0J7qyUadrJJSWOsid1X3OjSeydV05XLO
         GxUg==
X-Gm-Message-State: AOJu0YxUf0M/kXiQPiZJtDxZDmLQzzLS2jSjHR0GqFqCYXhOtPez3oSi
	wyDLMM9ohCTOTlqkvx2ESZsP+SihL58vhqh/7Hq/MAJDTEFfdxVUqsN83IzN1VRBE2mKXgPUlaw
	Z/EHD25eX8w1sTevozC7exzLbt2crzlVZfvCd5IG1zNEIjCD9gLPlG1t0wkeHig==
X-Gm-Gg: AZuq6aKy8IBcsG4WyCi2j8iXbsAhzebgAgEi0WyBp3Y/Q1G88FLu4ZgCP8C//QFo8sO
	N2o0DPKEYZouZ4siuBEMk5cGAVNVYXUsAkQ+yklp0IGYXm6ht6MK7I8jg4vU6Jt9ZLLbTqwohHB
	K9t+dcDQ9jhdY3RE4l1lTfr01n2BzeZkwfstqttO4SU5z/3Y9+3qCO5GnwIiFkuyvqHGjcn9f4A
	xkWynP1FGxnpfut8MJVuSIxv2hMjmnIS1shWv2YI8Jymz+gSon3+813bYSAhjj9+IOBoQyLO+Ih
	+SLV8hhnTO7kT6ahsLue9QkgbyFYjtZMrJQ0iI0AraOpHNx6FpiyRFo23lWX2j1Egwt5jQJWLix
	eVIoMHZMLGjHmJBeb6GxofTYEVrpf/Vz7OJSrgY9HWgImmHUTrDLK2vWUIyVDrQ==
X-Received: by 2002:ac8:5cd2:0:b0:4ed:bad6:9fa9 with SMTP id d75a77b69052e-5070bba0e2amr100498261cf.6.1771804283833;
        Sun, 22 Feb 2026 15:51:23 -0800 (PST)
X-Received: by 2002:ac8:5cd2:0:b0:4ed:bad6:9fa9 with SMTP id d75a77b69052e-5070bba0e2amr100498141cf.6.1771804283523;
        Sun, 22 Feb 2026 15:51:23 -0800 (PST)
Received: from [192.168.1.15] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8997c8a771fsm53701036d6.17.2026.02.22.15.51.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Feb 2026 15:51:22 -0800 (PST)
From: Brian Masney <bmasney@redhat.com>
Date: Sun, 22 Feb 2026 18:51:04 -0500
Subject: [PATCH 1/3] clk: microchip: core: update to use div64_ul() instead
 of do_div()
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260222-clk-microchip-pic32-v1-1-ceacbcd515d1@redhat.com>
References: <20260222-clk-microchip-pic32-v1-0-ceacbcd515d1@redhat.com>
In-Reply-To: <20260222-clk-microchip-pic32-v1-0-ceacbcd515d1@redhat.com>
To: Conor Dooley <conor.dooley@microchip.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Brian Masney <bmasney@redhat.com>, kernel test robot <lkp@intel.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1185; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=CJrk612FhmjDj3VPD/9bUWPYLrlPaYeOFopd1zExvM4=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGDJnTytN9V5zKl910yfBFZmvtdX/h361Nk3bFXBO//PU3
 uX6P6NPdZSyMIhxMciKKbIsyTUqiEhdZXvvjiYLzBxWJpAhDFycAjARluWMDFOFTQwCRP5ICthv
 zlxqzmC8syUoaAmfjqU9S8XbsyJxPxkZLn7mLffdaHMrSu6shduyJ5Nzbr06bKNU2Sdxc9uxBqM
 2NgA=
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087

This driver is currently only compiled on 32-bit MIPS systems. When
compiling on 64-bit systems, the build fails with:

    WARNING: do_div() does a 64-by-32 division, please consider using
    div64_ul instead.

Let's update this to use div64_ul() in preparation for allowing this
driver to be compiled on all architectures.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202601160758.bpkN4546-lkp@intel.com/
Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/clk/microchip/clk-core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/microchip/clk-core.c b/drivers/clk/microchip/clk-core.c
index 692152b5094e00bf5acb19a67cf41e6c86b11f35..2e86ad846a66cd5487f5412c09ab0ad25ebe3f79 100644
--- a/drivers/clk/microchip/clk-core.c
+++ b/drivers/clk/microchip/clk-core.c
@@ -341,7 +341,7 @@ static void roclk_calc_div_trim(unsigned long rate,
 		div = parent_rate / (rate << 1);
 		frac = parent_rate;
 		frac <<= 8;
-		do_div(frac, rate);
+		frac = div64_ul(frac, rate);
 		frac -= (u64)(div << 9);
 
 		rodiv = (div > REFO_DIV_MASK) ? REFO_DIV_MASK : div;

-- 
2.53.0

