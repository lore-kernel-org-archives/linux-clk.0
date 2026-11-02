Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793633341;
	b=vjbt+8Svv7oHyFuHq3UyoxegFi1zbyFGuKhwBT8SNdWOP/9GrtSaVfxbNMcERE7luAt/
	 DceLWQlNksinazRimk9v5ONyyO3A1sRZwBJlrSMuoAag/u5hs5istmhB37aFKua/ND2Wv
	 FNKZarT2hKKWOOZgkiyH9vtuFOGdtF+/2SUVoUNqn9WmWUPiIqdwISbSiGchk+JuiVeOy
	 pEu3DQn1ca6dkemoB23uosuLe2erRdBWBeADHaBtIj32LcmCpP2NmfHdWmX1xNO0dAbCA
	 Jp6nh1KJrUrNUcJTwJJOQ8CZHbhFODVzBcIdkCqI2D3/EIWhG4nlXLK7jVbc9V+mljQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793633341;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=jpYgEUXMFRpLpzuh6rGejLrl0sGWdYLAgubwEkCkQFg=;
	b=HsgUg/tTpnXWNqIsr0/8O5lrtbHLayTxkuzmJeWX1Xj2ApP4yW5r2+nAMg1jutfW5u1W
	 Ko+C4RR7aR1inaFByxGzeJ5ps3xyPgrTL19xQOTjFMaq2XahQBNkYHy+OF0ldcY1IKryb
	 IrYDvZNMPc/yODmHCHcturMBoKT7F4e8ap/uqRdawLe5vzhEJ22ed7Qx+x0iZCgC3oZRO
	 +kHVMtUFqKAhWXTL9/y0bbALwX2nrptBNN3gdUNGrpA2NaShSsigcSUVTfpUsHf1aIgdz
	 MuVZOw1PO3U2FOQiK1jkOHacdywhdtUjrh7NskxY+uc1j1Oe5cI2CcqILk9YBoF6LJA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=RTTSir3R;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 836CA60D01C8
	for <linux-clk@vger.kernel.org>; Mon,  2 Nov 2026 15:29:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 836CA60D01C8
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=RTTSir3R
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a5087a5348so25555375e9.0
        for <linux-clk@vger.kernel.org>; Mon, 02 Nov 2026 07:29:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793633339; x=1794238139; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jpYgEUXMFRpLpzuh6rGejLrl0sGWdYLAgubwEkCkQFg=;
        b=RTTSir3RL0u4FwfzJlXdc/GSHCIh4YqIPOVifKs669enMpxHfOhVq31kuGk5ELU2an
         Iye6agOg1ySFwnedfPXavffzwNjf2EP7aXCmHREzvpIpaHkPGNiCrgzKek628Urgo39/
         Whswk/kx88CqVTkmWR3h4fsJ9rQj5gxnfLzYM+1z8Y1pjih6u04F99ER8uRPe6J9Q6PE
         hTRyVEgAA58dNHx3fyvLEcSFNIaUQeWlUTwEm2DQf6mw5QIGI8HGkXeGgMXJiRF0Wut/
         jfvT45oc+p4pNPKOsBjygyqFu8NLU+RwmLQ3CpRceRXlvPH9YITkRGknjc2rs3kgWflC
         CF2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793633339; x=1794238139;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jpYgEUXMFRpLpzuh6rGejLrl0sGWdYLAgubwEkCkQFg=;
        b=q66+wXNZgm6FxX1+8bGc3vFGv4Lno6qKYVhkE16GhJGfVVA8VQVXq+hO1lzmuxAVBn
         MX6VeGssFRfqG+JmC9tX3vDndZFTS9MtUsdyQuXGEMF2Qr1kDnXa1RhasR3uYWGLKFz/
         RHxcJmHFiLI83agJv63KUEqAVvxGO7/+A+tw+LzAlIIIE4k082G6L/B5uAuF1uoPoVzX
         peKm5oC6K6PdrUpe54/5WRNaqvdlCRKBe1xBK+jqTOgzvddqnuf5jdJFtuMXz/tx0lQO
         SwZFP3Q1JFKaxzBDvwmzTPDPtN+/B9s49y6H9gF1nUk0u/NWoNK0/H5PGZAmmDWGBFfX
         94oQ==
X-Forwarded-Encrypted: i=1; AKwUvBzDJvMjBrpOe0e1kRtqXNDSU7LaHQwUyf47CtxzZvvs2yZMSdWaMvCHenW6/4WYH7LEA6lhWMFbZgc=@vger.kernel.org
X-Gm-Message-State: AFq9FYIlFe3eAC06L0jvrEIyInled+/DcN2WWeBM/RsmVp5BJuR383Oi
	zllZqpQQ5HLZpsagcX5ojVwe2xpudZKh4PyrruH78wgyp/XOk2BDR9ALf3883sXRm+I=
X-Gm-Gg: AYBFou2dwwNCGyEWsy8321MeBBR6+O9Rnt/Cir5UdTc8E/GWOVQZVBkRuz6QEl1yPiC
	ONVDg3iGLiF95lOlmQgOasKGwY4urwnATHBNXri7a4t9HR6sWHCLkmvVkOgG+LLfuynjXgUjuU2
	AY7fhTcnF++gqmzLLKHkehk5sYJGDIcKovhFSBv6I+L6BHOWrW969AkT9skXvyF1jWrFGhheOVh
	EgbVaQbN+LiWxfONmRdGeVo3Fnhzh6lW+4ZOUF5aCAq/SijUYGxV7JmwyQQZx4G7L3NzALoKJ9B
	OXwpz5BU2iuiGLDgvWOM7IcrcEMM37E9+Brvg1BA7shM0eP6oK/W4uTmEzCtUKrAjvOXa6GARiD
	9d4+D3KvwGrvMS+iA2ZWLzlbYRq45C4QE3ziFdcxJaVKRcau92EyNNmHnBszFX4ZAjnfsKWtt58
	v0/sIs00/M0vwe2AHPgfSle+5IoK+7mVk5AaXXBjOusnn3hMiH+8NPpiJdLK81XuS7NbRHTEV+x
	jHZ1XnBMbg9//9My4JY6vo10a7mJLtRDDyCeaHiajIa5RQc14pzsJ26hijJRqZ0Z0qIpnRMRbUX
	6R1e0bAVpX3h9+3mR+/KS0xhJ2OnjVRH5+CnCaZYr6COj93c
X-Received: by 2002:a05:600c:4e02:b0:4a3:59c9:a758 with SMTP id 5b1f17b1804b1-4ac19705e02mr225316555e9.32.1793633338944;
        Mon, 02 Nov 2026 07:28:58 -0800 (PST)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b80eb1sm21907349f8f.34.2026.11.02.07.28.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 07:28:58 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Jian Hu <jian.hu@amlogic.com>, Ronald Claveau <linux-kernel-dev@aliel.fr>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261023-fix-g12a-clk-v2-0-0b0b9b86d437@aliel.fr>
References: <20261023-fix-g12a-clk-v2-0-0b0b9b86d437@aliel.fr>
Subject: Re: [PATCH v2 0/3] clk: meson: g12a: fix a few clock definition
 errors
Message-Id: <179363333450.2870673.5521256341441057002.b4-ty@b4>
Date: Mon, 02 Nov 2026 16:28:54 +0100
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
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=475; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=UHmtYAda0lGZObY89vb/eGPORt1iA91FW+pe6vRHRPY=;
 b=kA0DAAoWrRk/eyua5RcByyZiAGrorDmjByjJBe5tD6E7zTW8n2IfF2kAowjccC0RauvXZtFJ9
 4h1BAAWCgAdFiEEfAt7F+4ZKvSalyzbrRk/eyua5RcFAmrorDkACgkQrRk/eyua5RdrYgD+LgqT
 qJyhqFLLMsiGPmZJS71z+tbVLAhGGnJjxQ01/0MBANcj2HeO4569Ea1fKVqMVdwkzp6fy5qRmfB
 qRRwtdUYI
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

Applied to clk/linux.git (clk-amlogic), thanks!

[1/3] clk: meson: g12a: fix swapped VID_PLL and VID_PLL_DIV clock ids
      https://git.kernel.org/clk/linux/c/9458f994b92f
[2/3] clk: meson: g12a: fix swapped VID_PLL and VID_PLL_DIV clock ids for g12b
      https://git.kernel.org/clk/linux/c/c56b8550e390
[3/3] clk: meson: g12a: fix swapped VID_PLL and VID_PLL_DIV clock ids for sm1
      https://git.kernel.org/clk/linux/c/5ca65bc758dd

Best regards,
--
Jerome

