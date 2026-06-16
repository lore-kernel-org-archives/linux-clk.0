Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48A4039A047
	for <linux-clk@vger.kernel.org>; Tue, 16 Jun 2026 20:27:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781641662; cv=none; b=qJjeTJk2IXjnzCaTIc/0IRk5WqEjZfyUVz4EW8vGMBoed4pj/528bccf0DdwG/adKVzuzov3hH9BoGOyujcC5w14l7cnLNdDR5z3p1yVW8KgJrZ+wsmQoWqKdhZU3Eq/ZQ5I/3SLsXRRuy88Syj5nGkGPWe45KGUBN1LZJkMDNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781641662; c=relaxed/simple;
	bh=dEe7AnhTFAr5p/XXrX/uCCb9oMxECR6QftpPnuBBlPY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eXIRteranF3Hr1tk3zSrb0C4qfsx+x0LRxwcI0DGfu/A8KHdzhqO4HzQ0to5daTEkn3w/MUmg6JREFaeSzsW0sgVJSVXUT+hKjJnlJ9yQvjTUL7ZNInKvu+FikURJ/gODKk0VoMpP3101WZJIwMJSgGpMx4wm1rJMiMzDAFYK1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qBVxIJfa; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qBVxIJfa"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-491609cdd8fso26562025e9.2
        for <linux-clk@vger.kernel.org>; Tue, 16 Jun 2026 13:27:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781641660; x=1782246460; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4T7EkkegVyODZ1yMUvqUb4I+TPr2uXbUfFIWfX/3x7g=;
        b=qBVxIJfayFVV2aFazRaPeUbEs9+fWNdVqCACaFiC33e613MwqIHfzDuBvHI/ar1imK
         TeSc0JVXlhmGe6rZPqGRxJCByU9FC6UPJcdNT9+ojIU9T1zRQUGDc4kqhAZN77Nyb7Wf
         0VaNgk0oiiMA/WCc+hjO8Ocd72I6xJ45mjfG0onGryVu8u24A290O3pT3HiJoKuYsT2T
         I+8rN0hFPXKXuDS5V6qD4DckFLLNiFnbNVlWVxS217rbUkuHXaLB6a66CDnh9LOf4ILV
         qhumeSdUEzYspe2RypFYSsVgvK0hvradJJZAqIylirjbFMsAHE4Pz++q/iFHlx0BTr7a
         RkQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781641660; x=1782246460;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4T7EkkegVyODZ1yMUvqUb4I+TPr2uXbUfFIWfX/3x7g=;
        b=q1eJQFZGgzXFucDAIldKjx5u0uTFXaTzrzDRKbo4XHDsIwPUQ5Z+9SQrQHiJtKf6jA
         Z7GlY6pBoXtHxeNN8jFEao/QnjtuBE8znNqWGkPnQwYvdaw/+hFc3wJfkk4o8NibD+8h
         oF9zsdPuRuQDI74wryOr48Jt6A7a22OEHcfY9o927nq6p5EalYtH0FCWCwlujvgR2u0I
         FP4i1C8mD5yqdYqVa9X1CNFL8F9hQC/8jFazUDO/LPkxrzWZhK/lA6S3seGgOlH1QIvi
         oCwuNim9Hi/Ke+qUtH83+1ArAlPlNvx32n72Rd9acQ5PK3RZ8fHw2qrSjTgnA9KWZBuO
         C0xw==
X-Gm-Message-State: AOJu0YyjynDDB9TDWqp4DCn1FVEqg/fepqojsEUPYaFyHNBKOx9hYC+b
	+reFNhm9UF3kLKmDWR4rOyjR611wdGTR2GJBOSHCjACf5m62eUZOmE4K
X-Gm-Gg: Acq92OEOEnIhlqEYtQkFPL3pUiU3/gkqXwbd/TDb8NcJWZcal7LV24gHaJy+KKjXAhZ
	NZCvL1V4Z5QMR+n0o3csIYovjrmZ3kgUmOPz7K8sWFg4uG1xUuNsap1fxUdrwUD+OkckleygPA2
	OdrZ1A6XLkVCcBRB2g8dYJIiID3hn4BqEdQI6I2FEUgnxryg7bhcqg/n7bxiC7TQ5E2kPRk3ZgG
	EftuhuspSchLhxJMSD4mbBKwT6L63b3u3WtSXUOVJF8FSz5tz5QW/+GVtuAYlxIKafiBuSIN9sm
	ArFf13LglsCK6/lY5Urz65SBJTv2rCDB5jBuOcol1DUOReP41+4jjwMMoNzmN/1dW36lmXP4yD0
	qj1zcOBDaJYt9A+wxpwVc90qGZzUSXTeb56Carf/rFaEopaJQffjKJmr88wl2SB2+hi1YlebiMj
	mNURWw3g8KMEOhiuKDuy8k4pg7oWDkGq661w==
X-Received: by 2002:a7b:c3d1:0:b0:490:9df1:f0cf with SMTP id 5b1f17b1804b1-492333a1b10mr11488675e9.2.1781641659641;
        Tue, 16 Jun 2026 13:27:39 -0700 (PDT)
Received: from [192.168.0.2] ([197.250.51.220])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49230a458f2sm89987005e9.3.2026.06.16.13.27.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 13:27:39 -0700 (PDT)
From: =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
Date: Tue, 16 Jun 2026 23:26:32 +0300
Subject: [PATCH RFC v4 12/12] ARM: dts: zte: Add a syscon-reboot for
 zx297520v3 boards
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260616-zx29clk-v4-12-ca994bd22e9d@gmail.com>
References: <20260616-zx29clk-v4-0-ca994bd22e9d@gmail.com>
In-Reply-To: <20260616-zx29clk-v4-0-ca994bd22e9d@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Brian Masney <bmasney@redhat.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=817;
 i=stefandoesinger@gmail.com; h=from:subject:message-id;
 bh=dEe7AnhTFAr5p/XXrX/uCCb9oMxECR6QftpPnuBBlPY=;
 b=owEBiQJ2/ZANAwAIAT0TvMhUTxoiAcsmYgBqMbGGdznTfH74HtE8ynnSgt60AzmAGzDzYjSBF
 v5tV/6RRTmJAk8EAAEIADkWIQRDFvS2qgVbJ5UyXWw9E7zIVE8aIgUCajGxhhsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDIACgkQPRO8yFRPGiKHEw/9FhrXlF6q4Lzp5fUaLbRw/bc/1+9787X
 vYpRe2fXPGZx9mRtm/9BiFcwv84Yw1sVzTFxVOEfG69VjUX+Ku1D2Tk5Q8HT3O6fSn5I9lObMwt
 kboi/YHrRmec5FIxp8tVGKQSZ7IrtPMkJhQFDs/PzAq0ECfW1pgtVd/kw9s0WqVVliTP+Hu7io4
 zeW8EPpUz4HrN9dB8PdC7wo6nL2keck2pwuIqPfxNRRRxItmUbOwNxNTAaZopvL12WPT/tnD0Xm
 w7TvVmXK6e8iEdznzirlzYc8akeQe2NveWLTO7yNOybrt/UmoWR/NNlkXa6McyKkSGHDRuG1VWB
 7/UWwaQqyWW4CG96xs0PIV5zmFV1b4j6lLgnGoSV2YHR/RJ0DqAxBJ3vUhSouV+J7NNwkl4XUgr
 dYTiRMN4hzq/3imJh08ZRi7AzfZWU3pGob+CwmeCKzhrjYcDLpR8mFFRqGuaRkXpywo14b/jeK8
 yD6ZCDRvH8hT1HXv6dAYhIxBnorfg57VBPMWUOM4NEWCTvQaV9MXLTO7V6GmkZ+TIeysUXU/aVa
 qyb5CKCJptLSpp4D17PARQZ2Vzg2ov9eomoWzLNZ2Sll7WyGs8tdeSwzdix48gEWPfUS+OLWVWE
 3hfSH9JKGwoLDkvwwS9LQzW5/uwgcLIT3UeemWbz35claV7Zzc8k=
X-Developer-Key: i=stefandoesinger@gmail.com; a=openpgp;
 fpr=4F9C2C8728019633893EBBB98CB81F9A72BBA155

This is fairly simple with the driver exposing a syscon regmap. Write a
one to the lowest bit of register 0 and the board resets.

Signed-off-by: Stefan Dösinger <stefandoesinger@gmail.com>
---
 arch/arm/boot/dts/zte/zx297520v3.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm/boot/dts/zte/zx297520v3.dtsi b/arch/arm/boot/dts/zte/zx297520v3.dtsi
index a2b6909e7434..013ece51c2a0 100644
--- a/arch/arm/boot/dts/zte/zx297520v3.dtsi
+++ b/arch/arm/boot/dts/zte/zx297520v3.dtsi
@@ -33,6 +33,13 @@ osc32k: osc32k {
 		#clock-cells = <0>;
 	};
 
+	syscon-reboot {
+		compatible = "syscon-reboot";
+		regmap = <&topclk>;
+		offset = <0x0>;
+		mask = <0x1>;
+	};
+
 	timer {
 		compatible = "arm,armv7-timer";
 		interrupts = <GIC_PPI 13 IRQ_TYPE_LEVEL_LOW>,

-- 
2.53.0

