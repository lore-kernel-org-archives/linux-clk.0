Received: from mail-pj1-f65.google.com (mail-pj1-f65.google.com [209.85.216.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CDE644D033
	for <linux-clk@vger.kernel.org>; Wed, 21 Jan 2026 07:14:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768979703; cv=none; b=faqxcWa3cb4d/nVgLdclSX2EQAUfw2es9EfLqnfj0n9sVLBdBdNMyphmkq4dhUa6/IGWZsG9/dlzKKTVUVs731ofTEmgbrieLUdB5anRYIEeOzJb28Hr/Dwq4EUSTwPiHOZU0YHPXZVAQmpl4DyDFbPR1YjVW9ty2HyLt4oLtmE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768979703; c=relaxed/simple;
	bh=ASVCGF+65gM4kzc00o/lzqdcVsxqI28Mzu1yeg3kP1o=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=NzDNwKGMqfq/yUFYLkFs09llk+ysvNUpdmqOijm8ufrmrijaHK8H1FRajwZA7wSl+FqcnP8SeOnGNJ5XnN7x/D/jciwOGUCouOWf/c9H98RzH+FVxqzStcs+rF8CVIY7pJUiuebNgo01JSJY5lohqrIT93l5H+zlApGtTLTecg8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Cg/DxZ94; arc=none smtp.client-ip=209.85.216.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Cg/DxZ94"
Received: by mail-pj1-f65.google.com with SMTP id 98e67ed59e1d1-34c718c5481so3009682a91.3
        for <linux-clk@vger.kernel.org>; Tue, 20 Jan 2026 23:14:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768979696; x=1769584496; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=F60LwWqAp1YKpLWFuVlWdTZRt79aXAUJCqZHEy/se+w=;
        b=Cg/DxZ94NelATCcbKhCawKm1TeUpurvoPqtiF+4l5QyFM4nksZIjDmKgfqNqYGtbPK
         8ZFgCq1lb2H7rduvF1AcoJQzLXAHSRJDEuyrtuvQajdN9SV4wIzI5PURO7TC4ccXzB4u
         /2nbQllvvqXP5/aujcuj8ZUT+b9rJmZAtbS6qdg7Z4jOhuiEe7adHEjfzvpG0gdgJoQH
         ApNnR+Mm2nMrfCp1ly5Ug5vkgI6iK8HQLtEkrD/Bj9tppd4QAh0aNFjL02kth8cGt3c8
         0lTbf28yP/ph5Z+RF8EuiG/hoJT9L6OY75Rn0AJwJ5qVNijuEy/N/LJ5cA6IU73c5pC8
         FsVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768979696; x=1769584496;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F60LwWqAp1YKpLWFuVlWdTZRt79aXAUJCqZHEy/se+w=;
        b=tLRW78bZ2N3/spLJsmRL0abPBib3zl2qcw9koZVx6v+ufER9NH+SJ1dBJ0zEApQ6Kp
         ngSx4kX8pweTT90ArnVSR7Jmrcp1G5n8L011iB/eyd6IqvKbNyF9QCSMCoM2YGWubt0S
         5uAbQ6Onu1mE7QlkD0XJqJUrvgywTo36C1nWBb6F006L7Lcr5B8EmYUPqTVrLPg7MMxQ
         8pCgpF1QWtGCYjAnwOzgk7E7rvewtNNggZp/K5YxLvtHBDKZJVIG6rh4HapnD7PcoTx/
         pPEkq4G8O/MIo9adgwufiTlYPVCUU/Ka5UK5wWen8JpMdrEYLLePqOj8UwQI7gmWnO6F
         CrYA==
X-Forwarded-Encrypted: i=1; AJvYcCXEamqIwpA+wTkpsgERcicuG0XqqQRLpa/i4rtK+eDCJ9cknsfr3H+pY9CXqcOsfhKAyk5S8FAH38U=@vger.kernel.org
X-Gm-Message-State: AOJu0YybTNT387oKd7S0ZgWf0AnsILWEFfpNMhqrXYcYOs49nocjfs2G
	912q1dt0X7hT5oaYRSkR+n+1sQd2Dq2vFI6vwmI9gskr4NYEsBF5BhcJ
X-Gm-Gg: AZuq6aKZgWydf/L5X6/FVmyWZST0uOzmQOfz+noVStXH1K+buEL1O0tUdMrSEUJXgyD
	80GcOiaEnHsPSsiTc1jfY//sl+SK5Ilr2L5hKXAegxGvS561NG5G2Xn2AvCqJM53UQqW/JlnaB4
	OEn2IhoyIxWUHaa/kbCT1XFouD/MLQIQ8pVoksV12AsckSpdVtQO2m+gbHboOgRy0ZNxP5PXuq2
	T0yuXRyuswJnF4opeBt461v52PzWHeM/gc7v4jfo0oBe7ARtHV3IcsaE/g9199bayMvWtOKP9Tj
	RBgOY2sEqet3uzf0H7OIn7POH/LXSNcM8TPYTkVMECEpCrD0hjZa1HcDnc8CuuosRdSPzRRUy3B
	zIz/DJAxWQscqDhWG6JK+qYaLcw7OiUjDpgS5ExXryXrMH33ekxmR7P7026edgbjIzq3AR32yt8
	EyfwynAOzVkzVQlg==
X-Received: by 2002:a17:90b:5864:b0:33b:b078:d6d3 with SMTP id 98e67ed59e1d1-3527323b4efmr14020472a91.23.1768979695646;
        Tue, 20 Jan 2026 23:14:55 -0800 (PST)
Received: from k.. ([223.74.152.156])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-352fb191a62sm507411a91.5.2026.01.20.23.14.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jan 2026 23:14:55 -0800 (PST)
From: Nadi Ke <kenadicanady@gmail.com>
To: mturquette@baylibre.com,
	sboyd@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	orsonzhai@gmail.com,
	baolin.wang@linux.alibaba.com
Cc: zhang.lyra@gmail.com,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Nadi Ke <kenadicanady@gmail.com>
Subject: [PATCH v2 0/2] clk: sprd: Add support for Unisoc SC9832E clocks
Date: Wed, 21 Jan 2026 15:14:10 +0800
Message-Id: <20260121071412.256215-1-kenadicanady@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The SC9832E clock architecture involves several PLLs and gates. Some gate
clocks are located within the PMU global register area.

** Author Email Change **
Please note that my previous email address (kanadenady@gmail.com) is no
longer accessible. I am submitting this version from my new address
(kenadicanady@gmail.com). I am the same author as the previous submission.
Please update your records accordingly.

** Technical Details **
Based on the review comments from v1, I have significantly refactored the
handling of the PMU gate clocks. The hardware registers for these gates are
scattered within the PMU global register space (interleaved with other
system controls) and do not form a contiguous region.

To correctly model this hardware:
1. I removed the artificial child node (`sprd,sc9832e-pmu-gate`) which lacked
   a valid `reg` property.
2. The parent syscon node (`sprd,sc9832e-glbregs`) is now defined as the
   clock provider.
3. The driver has been updated to match the syscon compatible string directly.

Verified on SC9832E hardware, clk_summary shows correct PLL rates and
clock tree topology.

Changes in v2:
- dt-bindings:
  - Removed the artificial 'sprd,sc9832e-pmu-gate' child node definition.
  - Added '#clock-cells' to the 'sprd,sc9832e-glbregs' node definition.
  - Removed 'simple-mfd' from the parent node in the example to reflect
    that the child node (if present in dts) is logical and shares resources,
    or that the parent acts as the provider.
  - Simplified 'allOf' logic by merging similar conditions.
  - Added mock clock definitions in the example to fix dt_binding_check warnings.
  - Fixed 'compatible' array definition in the example to match schema.

- clk driver:
  - Updated the OF match table to match 'sprd,sc9832e-glbregs' instead of
    the removed child node compatible string.
  - Fixed a compilation error due to a typo in variable names.
  - Updated Author email address.

Nadi Ke (2):
  Add device tree bindings for Spreadtrum/Unisoc SC9832E clock
    controller.
  Add clock driver for Spreadtrum/Unisoc SC9832E SoC.

 .../bindings/clock/sprd,sc9832e-clk.yaml      |  182 +++
 drivers/clk/sprd/Kconfig                      |   10 +
 drivers/clk/sprd/Makefile                     |    1 +
 drivers/clk/sprd/sc9832e-clk.c                | 1077 +++++++++++++++++
 include/dt-bindings/clock/sprd,sc9832e-clk.h  |  177 +++
 5 files changed, 1447 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/sprd,sc9832e-clk.yaml
 create mode 100644 drivers/clk/sprd/sc9832e-clk.c
 create mode 100644 include/dt-bindings/clock/sprd,sc9832e-clk.h

-- 
2.34.1

