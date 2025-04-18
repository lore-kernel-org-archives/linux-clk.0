Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D1121DED47
	for <linux-clk@vger.kernel.org>; Fri, 18 Apr 2025 14:54:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744988056; cv=none; b=cRVHD+t51SjjPrAWCBsFOS3TL5Nn9LylVm+wi27GdM6Tokbe/Y946uh3JLVCh/gNKjc9NMRH3HeamczAqXum3b9XEjpzA17hhI7e3IXRwXkqfrhg260e3rb60LiXrOE8tZqYkvtQBsYLoAavAz0OlGJowXMpDnHSEUjV1dSPqKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744988056; c=relaxed/simple;
	bh=WK+79Sgay1nnVSQ9s+Gs0FXqatmC3OKXtMgoy/+gdS4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OlC6KvwHvhbLdwex6M2XPb0QPIznCH1Gti1MrSxFjTu04KGmAxe4a5VjvVW+0LbfKkkETuZfEq374gzErN5Tl5TG43EBF1ZRm7VfL9TcwOXGX/xdNS5YuOce8MyKRDJAX7GaG9CHFxvQI3NGgVP4qT6QbgnoNgJ9mjq8bc+rkq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=STm7cRqg; arc=none smtp.client-ip=209.85.160.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="STm7cRqg"
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-4766631a6a4so19838361cf.2
        for <linux-clk@vger.kernel.org>; Fri, 18 Apr 2025 07:54:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1744988053; x=1745592853; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q0cRJZr/QLbnC//i+6RCLRRi6tJxaoAhZJAaalWswhg=;
        b=STm7cRqgbzXsEmmCdHD0H2UWql1TmtLnFvK//+vMkrOEuOBECtQ5lD0jN2FiNVVsa3
         Ey0y6CygPY1CWrRJtlpUY1TWoYt9izoatFX8pIxMRlw1AvqsJNAaZF0J4aqf5kam+fGP
         sxuj/wkhtaRS6fmYKwd+cnnc2FenvrMKr+RiY48C17MO9TVzvkQVnGdXhoS/thiA9oiR
         wf5lQB6tNHX3IK50AbRFP+0p6AFvSOaZqHz3/79CmO1x5jldfyr5H8cXmyeBWx7uB+mU
         0RE5+z/oRj0lCJap3cCKvIQq3DnUSvMcTu/1RghOoY6bWj3+qNmtvVU/jBQbqUTJYbpT
         vZjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744988053; x=1745592853;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q0cRJZr/QLbnC//i+6RCLRRi6tJxaoAhZJAaalWswhg=;
        b=VxdyWoga570Q3SoS39wN+4/ANhPPnSnCuHFbsVyrhGdeSoXkILU07gXqd2ODkXvi6l
         gNKQXAyjdK+muimjzIfZJnCryQ5uf/Z0IqpSOgiB6wGZO07YiANBkQLaFz7Z3FddE/Ku
         b+cJKqN2inu9kKqM7ilXmNYVQ5tKZmnzZqbFoMphKn4CGDPQnrGdAPHFJNM6/WGJ/P7B
         WM3MrHQJq+7rRdmNLJM7BKSQbjjTenxyhOjqGBYydJhAmpsWznHjeTidHLAqfoL6yZGf
         7IuOTICx0WcQPGbbd6V7iCBR9e8brsuRw2i77B5uOVGtJwSTIkiaiCf3uNGIrhu93Q0J
         hnfw==
X-Forwarded-Encrypted: i=1; AJvYcCX3tmUC2ez7RvSMu/4tBU1XUjbSW33VyoMuf3NMSA+T72B5ac3cuV61WHuiX5taZ6b+3mZfuFAjtBM=@vger.kernel.org
X-Gm-Message-State: AOJu0YyekzOqgDFFtWAxZvZG16pLZI+3/Z+gTJ016TyWW4zQaE2r4fXm
	sBU5/zURLR1GpT5xVyG8Ll7vqQlKlffFiuRW9mYyiB3gmB9wSmszjZjqAFCxOiE=
X-Gm-Gg: ASbGnct+4BH3wNB2yqcVBUYjjuaUcszWxW2K0QDrL7guj/0h+8i0CPG2TNhPF3tpnhT
	enJJJ6xMbPLolRMz2qGfS5azpzCscUUAnJmI7EB+OIZkRrBSiZceyYs0+0tBuoNBiAUUzNROrT2
	CdP4PejJh7vYm4eW4NKXCSXGhBTL88PhUzlK0Z4yVg1yG2f3rLicNFOA31vx05tt1Sn9XbrzB+n
	L15IeVgMw9QoATyQoLIphH7yZOF3hJU3JEE8ezrbGh5yrf/cQWAYRODuNnd2I/ygdMgm2DRbrMk
	9r7fsTdt2Y4nwNFhTMRhhX9WPJCDo7cT5wx8Doe/MpS+W8Pq9iOFgzBQdMSZxt6Qo216Cm3e9bR
	V0fitOxpx2gluLw==
X-Google-Smtp-Source: AGHT+IFZ0pFYNx2snWn3YpkMMZYSR9nF5fcb5GLtk7fhZ50PwkaLo1+AOy6UlMO++lE568O7vJ+T8g==
X-Received: by 2002:ac8:5f89:0:b0:477:4224:9607 with SMTP id d75a77b69052e-47aec3a6358mr42212621cf.12.1744988053257;
        Fri, 18 Apr 2025 07:54:13 -0700 (PDT)
Received: from localhost.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-47ae9c16ddesm11329201cf.3.2025.04.18.07.54.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Apr 2025 07:54:12 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: mturquette@baylibre.com,
	sboyd@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: p.zabel@pengutronix.de,
	dlan@gentoo.org,
	heylenay@4d2.org,
	guodong@riscstar.com,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	spacemit@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 5/7] clk: spacemit: make clocks optional
Date: Fri, 18 Apr 2025 09:53:57 -0500
Message-ID: <20250418145401.2603648-6-elder@riscstar.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250418145401.2603648-1-elder@riscstar.com>
References: <20250418145401.2603648-1-elder@riscstar.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There are some syscon devices that support both clocks and resets,
but for now only their reset functionality is required.  Make
defining clocks optional for a SpacemiT CCU, though at least one
clock or at least one reset controller must be defined.

Signed-off-by: Alex Elder <elder@riscstar.com>
---
 drivers/clk/spacemit/ccu-k1.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/clk/spacemit/ccu-k1.c b/drivers/clk/spacemit/ccu-k1.c
index ad5f41695f8db..dfc8aa60d4345 100644
--- a/drivers/clk/spacemit/ccu-k1.c
+++ b/drivers/clk/spacemit/ccu-k1.c
@@ -1218,6 +1218,10 @@ static int spacemit_ccu_register(struct device *dev,
 	struct clk_hw_onecell_data *clk_data;
 	int i, ret;
 
+	/* Clocks are optional */
+	if (!data->clk_hws)
+		return 0;
+
 	clk_data = devm_kzalloc(dev, struct_size(clk_data, hws, data->clk_num),
 				GFP_KERNEL);
 	if (!clk_data)
@@ -1329,6 +1333,7 @@ static int k1_ccu_probe(struct platform_device *pdev)
 	return 0;
 }
 
+/* Match data is required; its clk_hws or reset_data field must be non-null */
 static const struct of_device_id of_k1_ccu_match[] = {
 	{
 		.compatible	= "spacemit,k1-pll",
-- 
2.45.2

