Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EC4131D36A
	for <linux-clk@vger.kernel.org>; Tue, 25 Nov 2025 12:06:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764072388; cv=none; b=evRMAoVn+siJDHhl48R4gGh+df9ktjZVSTxlu7W6x1SYvEGfP8ALvvbBJtN4jbo4yAq3AoyW8V1/fVgZPoB9iebuzyWXm9bM/szGYdLhUvjX3XR+vhfDbDPkfPBm1Hs7B0uGyOIb1DtvqkNvs1k+pGlKd9Xznd9gPqJTtlbRFGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764072388; c=relaxed/simple;
	bh=EpZL32Jyo1zVK7iE7f/cCfj6bklP2cCKT0AbKLrFi34=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DJgDCq/J4r9jK+woOqksSzfjBrsJWwxwKl0xSaE/TNn5aAAAKHarNGIXUu63XXoPM/UrfDGbQaUYJyF32SU1Th09IAwGiUF/IWqvnJ5nye1/KwWV+EGuklnXIpkq8kZuqiMc+mLv4zEQ/nfh63mlXgo+LD6BSm49kyGG1Lh7xhc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Go3cfmqc; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Go3cfmqc"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-594330147efso5593341e87.2
        for <linux-clk@vger.kernel.org>; Tue, 25 Nov 2025 04:06:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764072384; x=1764677184; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vVffN9Slo7nSA6jMy+HnfjnzdqrKlZ/cdmvcQBPmzT0=;
        b=Go3cfmqcfpuW9RUC6Mk7WE7nzPEWU+fH0RWjBM59qKzSgrSJ+wjwWKL7ltJFgjcDfy
         MhU8s8NO9mSXC3LyT7VByI5xz2w2fIDJ5RJlXU2HI0mBiq7YYpce2h6pq4HOH893JCT/
         PRFbog3fYgrEmLxaVL5ux7UQmmzzm9Hk0kLP0nVOipE98uyZGKGoJSgv3dv8xKQx7qI+
         UV7pr9nogDskDXyHyuB81rRqwiqmEHk6Kio8azYRm6kioUSI0BujgbWKes/5fJibIXkG
         N1LPEHcLB34lowIVIKVb+wbl9NTb++9WEJBz/G2Eb/xDGsV6xsuEJC71nUfqwLnIeB5z
         s2/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764072384; x=1764677184;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vVffN9Slo7nSA6jMy+HnfjnzdqrKlZ/cdmvcQBPmzT0=;
        b=R2grZyBo2I8ZLEz+XPK+pX5RrHTqZLQDuorMiGu0+UnWM3qsfOEbZtVsTagNiHbip6
         jT+IWNpd6FZ+Wz/b/YwPBtHNgKwDmNF7tp2cGsjxZJjhXDwFdDlCWYb7tf4tl2ZNTrFY
         0ZlY4ypafdtiV4CDgcQddRZd6HIUKK4n+vcA2P/pMBLLA7f5g7nUiBhpeavJznXE1ApP
         11dwOnyv+RBJiiOk8z/rBlBbz7J0MITevDF2aeLsQ0lMcB4zSSXhcifEdMDsbgJf8Bpz
         5GCGXi/bNMoFgSzFqqOSLKFXTA8P7WPsVHC6m8agRbPdp2ruSoZFZWDesnARR8txEK5z
         GmyA==
X-Forwarded-Encrypted: i=1; AJvYcCWqeT2EagUxga6PVajVtYM+e9Y+WXZm8+ZlHZxjmPlfSxUiMFSAwbaAqqQ9IwqXv4pNS/fcSrWEMsI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzWz3QaVOBrtwAo/lpGk80YtHU3V4DJ3CAMGBPTEAz/js1cX8tW
	39bGQJbM07MDA8AhM/wtkRGyqWUr/uXgPRTTT9YdaOaBMsf+5a5OonGw
X-Gm-Gg: ASbGncsk359+HLagH6asBEcZNoCGcT+HaWRn33deDNU4w7RclGs+y121/JNgdeg0SQs
	hkwqL0IpxVttZsQs55jJ/FCRxKSwN8SrnelnTLguYd566/Cy0wQUDysfq65ehrFzOH1xeibkucS
	scA3GOJaYsw0v+RFhGKIzSH1UvQnBcsU2AoI3nh03QZKx+xISOoZcLyBs7vNI66xZF2odJ+2nwZ
	caJlA3G1v0zT0OU/CZA9DFAPOGFxNE4WqZRpFN82UuOfCZEQFZzS5LGiqjMC/Z3WXpfkliru6H2
	tdYX79EfMTaWuYm5A6lDDcHRaB3RdXGtG6pGXqdBzZVj1a/pjfBrWyXK/TVFI1mLnhw5FPJdbyu
	/068aTMeoWf9Z2ZYpUHTcx6TWZ38LOva9ZYZwhCk7LXfvKDC+66kmOwy6KUglAA9GQBFrR6BMKG
	c=
X-Google-Smtp-Source: AGHT+IGOhBY4VdvmRQpYmf7pO7i0NLn6lazxvfZmPrqmAfJipbxasneXvNQ86FlomE8gw6o627DZdA==
X-Received: by 2002:a05:6512:104e:b0:595:9152:b93b with SMTP id 2adb3069b0e04-596a3e63731mr5440707e87.0.1764072384245;
        Tue, 25 Nov 2025 04:06:24 -0800 (PST)
Received: from xeon ([188.163.112.74])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5969dbbecb9sm5150993e87.58.2025.11.25.04.06.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Nov 2025 04:06:23 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <treding@nvidia.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Prashant Gaikwad <pgaikwad@nvidia.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Dmitry Osipenko <digetx@gmail.com>,
	MyungJoo Ham <myungjoo.ham@samsung.com>,
	Kyungmin Park <kyungmin.park@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-pm@vger.kernel.org
Subject: [PATCH v4 05/12] dt-bindings: memory: Add Tegra114 memory client IDs
Date: Tue, 25 Nov 2025 14:05:52 +0200
Message-ID: <20251125120559.158860-6-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251125120559.158860-1-clamor95@gmail.com>
References: <20251125120559.158860-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Each memory client has unique hardware ID, add these IDs.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
Reviewed-by: Mikko Perttunen <mperttunen@nvidia.com>
---
 include/dt-bindings/memory/tegra114-mc.h | 67 ++++++++++++++++++++++++
 1 file changed, 67 insertions(+)

diff --git a/include/dt-bindings/memory/tegra114-mc.h b/include/dt-bindings/memory/tegra114-mc.h
index dfe99c8a5ba5..5e0d6a1b91f2 100644
--- a/include/dt-bindings/memory/tegra114-mc.h
+++ b/include/dt-bindings/memory/tegra114-mc.h
@@ -40,4 +40,71 @@
 #define TEGRA114_MC_RESET_VDE		14
 #define TEGRA114_MC_RESET_VI		15
 
+#define TEGRA114_MC_PTCR		0
+#define TEGRA114_MC_DISPLAY0A		1
+#define TEGRA114_MC_DISPLAY0AB		2
+#define TEGRA114_MC_DISPLAY0B		3
+#define TEGRA114_MC_DISPLAY0BB		4
+#define TEGRA114_MC_DISPLAY0C		5
+#define TEGRA114_MC_DISPLAY0CB		6
+#define TEGRA114_MC_DISPLAY1B		7
+#define TEGRA114_MC_DISPLAY1BB		8
+#define TEGRA114_MC_EPPUP		9
+#define TEGRA114_MC_G2PR		10
+#define TEGRA114_MC_G2SR		11
+#define TEGRA114_MC_MPEUNIFBR		12
+#define TEGRA114_MC_VIRUV		13
+#define TEGRA114_MC_AFIR		14
+#define TEGRA114_MC_AVPCARM7R		15
+#define TEGRA114_MC_DISPLAYHC		16
+#define TEGRA114_MC_DISPLAYHCB		17
+#define TEGRA114_MC_FDCDRD		18
+#define TEGRA114_MC_FDCDRD2		19
+#define TEGRA114_MC_G2DR		20
+#define TEGRA114_MC_HDAR		21
+#define TEGRA114_MC_HOST1XDMAR		22
+#define TEGRA114_MC_HOST1XR		23
+#define TEGRA114_MC_IDXSRD		24
+#define TEGRA114_MC_IDXSRD2		25
+#define TEGRA114_MC_MPE_IPRED		26
+#define TEGRA114_MC_MPEAMEMRD		27
+#define TEGRA114_MC_MPECSRD		28
+#define TEGRA114_MC_PPCSAHBDMAR		29
+#define TEGRA114_MC_PPCSAHBSLVR		30
+#define TEGRA114_MC_SATAR		31
+#define TEGRA114_MC_TEXSRD		32
+#define TEGRA114_MC_TEXSRD2		33
+#define TEGRA114_MC_VDEBSEVR		34
+#define TEGRA114_MC_VDEMBER		35
+#define TEGRA114_MC_VDEMCER		36
+#define TEGRA114_MC_VDETPER		37
+#define TEGRA114_MC_MPCORELPR		38
+#define TEGRA114_MC_MPCORER		39
+#define TEGRA114_MC_EPPU		40
+#define TEGRA114_MC_EPPV		41
+#define TEGRA114_MC_EPPY		42
+#define TEGRA114_MC_MPEUNIFBW		43
+#define TEGRA114_MC_VIWSB		44
+#define TEGRA114_MC_VIWU		45
+#define TEGRA114_MC_VIWV		46
+#define TEGRA114_MC_VIWY		47
+#define TEGRA114_MC_G2DW		48
+#define TEGRA114_MC_AFIW		49
+#define TEGRA114_MC_AVPCARM7W		50
+#define TEGRA114_MC_FDCDWR		51
+#define TEGRA114_MC_FDCDWR2		52
+#define TEGRA114_MC_HDAW		53
+#define TEGRA114_MC_HOST1XW		54
+#define TEGRA114_MC_ISPW		55
+#define TEGRA114_MC_MPCORELPW		56
+#define TEGRA114_MC_MPCOREW		57
+#define TEGRA114_MC_MPECSWR		58
+#define TEGRA114_MC_PPCSAHBDMAW		59
+#define TEGRA114_MC_PPCSAHBSLVW		60
+#define TEGRA114_MC_SATAW		61
+#define TEGRA114_MC_VDEBSEVW		62
+#define TEGRA114_MC_VDEDBGW		63
+#define TEGRA114_MC_VDEMBEW		64
+#define TEGRA114_MC_VDETPMW		65
+
 #endif
-- 
2.51.0

