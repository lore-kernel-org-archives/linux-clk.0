Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B785A2EA14E
	for <linux-clk@vger.kernel.org>; Mon, 15 Sep 2025 08:02:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757923346; cv=none; b=hO8cOMC6Y+gCDTedWzo21roRZ7jwj14ZsQUXIdoLmLCf0L1xhpERCIZU+7v1RJocr8b0zFpA10jxfDUefLVpp9sE1iPSqxOLL/QJ0exXCel4mOFRGmxeJrGPbgyUxgHCjjLerdYGcWOoUwZyU+lq50oN9UyZ8Yui+rDet0vhwlk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757923346; c=relaxed/simple;
	bh=zND4GhxFU/tz0sYLfWaRU8glzS+okJHK24B1i0p/cZY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uD8/eLJBjAMv4u9X6izxj5tQGbLF6TUhwnPJVF1IUSH5jGS9yz6mz2EGsHpYT628PhOgx6pMJZcckz36/62rF0aduVZ6qbLX/i2bxe2iiFADHddpM+oIlLS/CLY3eGUTJx9QMLSBwbflnxF6IxmGHC0rSUZITYQ+sr0A/6AAl6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K9o3Awbg; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K9o3Awbg"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-55f6017004dso3929685e87.0
        for <linux-clk@vger.kernel.org>; Mon, 15 Sep 2025 01:02:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757923343; x=1758528143; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I+y0n2iQaoQRxXuIEAJP6wVzz5TSA3TjXyGRiIjZrCw=;
        b=K9o3AwbgmZiQ/wdnFKUyEc2dCx6D5gVDTz+yZRekRc8pJdKcSydcnbf7psHj1pdExI
         ofMDtNmiLOP7w5RTwWU6LvrqtDlzIuee2jH7VEtVnx67GMh1gTQ5fZsfFHRNT5Oh/Kwu
         HMgy7QX2Edbvgq29gf1Elrop4XC9Y6+yMjd6E/8MdqlSVXS5PLPUupDqE2t2/AJiy98Q
         O3RP1xk3wP0CDTEdYpkcemPWEjF57hYoLVFH1TkJsFATOaTM/NSGHqiJmcUJrZK1fjaw
         EPZkICu3B3UYEQ6zlwWHRnpNtxOSMQCkyvnFp42A/5FgaA83NVqRogyN//XnhvlMa0Ck
         bupQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757923343; x=1758528143;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I+y0n2iQaoQRxXuIEAJP6wVzz5TSA3TjXyGRiIjZrCw=;
        b=O4KhzTkfRKs2Zaursb57F4tifswQIFqIDDzgx4z5RVYUlPjy0IpD0eUHKhz4Rn6kaZ
         KwfAbTP+lvHIxLEflNksnb6hKN1k8arcrrv3CFxBUD3RUtyl+OHm/k0EfawGFMn9W1lw
         XvmplN4SqYwnje5kZJnhT+bo3/h69YHpNjuTNCkcOQCfpCikMtiAgDLlKDJdGK5ON/e5
         XPKHviaFBn9FLV/WQSKx4A3B0LAyjqlLIOwN/k1tM/dflytfR3gjt5uYk36b4EracPHV
         i9fvOWbsIDrHxwvlyggFZCdRkabS3mzoQ9dqO5ptOMPgp7awEoo1/VTJDxFFCv2XwB14
         IkOw==
X-Forwarded-Encrypted: i=1; AJvYcCXSpqwVu9JTAveE85Eif2gzPdJ0ii9QCBWD+rRvokkfhAI10NeFKdmj14rZ8ktYZ1WpoAWuCRW/5aM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxYyyCCfHje4D/3GtvlFJdlXBlNiHHzsSz2HSgw/BLpAvO8QGJG
	XT1hPyF99OpEkAvw0kqW4SYkywky5tSqhqDcR2Uzq/SrrtmBAzIDVQOM
X-Gm-Gg: ASbGncuV5EjvexUn2NM8lTd59iIYiSTzoY/bEGzwij0bvoypJtbwusU6WEOWHPGOoAO
	uF2iOvDK4ujjA5M2KaB6nQsRpi5/GsSOOW9IrmENtH5pByOAj+ytI2zhaEDGma+r5hloVdid4d4
	I6N3ANSIbqP/WKsWJJnB0gUlNrSwiBPoWumrxtQgn0YC4uXMZZHOXx7e3dkQ1AqmFI7G/4lOSGR
	/SuI3P0fsK9sVV+e9S9OHjUAQFZG+HxgKpV7CVksrHtHc6cJEljL3UxtWvirifiMkRgwFWdJEO5
	EiDEzsIMzSKvJIl5PABaBrG2P4B8ol9wdze60KMfYcJDnrrhbRg7UDiT/0y4WohKnQS4FB1/aY/
	GvJF3sglkCgzMAtbCszCgzN2F
X-Google-Smtp-Source: AGHT+IE6lsTSCi1HbUYjhR6DRaTx/WD5l7j/ig8VpXqBNn3d/LYOB9q6iXpX88ot17AUCeJYiqAUPw==
X-Received: by 2002:a05:6512:79a:b0:55f:536f:e89b with SMTP id 2adb3069b0e04-5704fd772d9mr2486614e87.53.1757923342570;
        Mon, 15 Sep 2025 01:02:22 -0700 (PDT)
Received: from xeon.. ([188.163.112.70])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-56e6460dec4sm3392381e87.103.2025.09.15.01.02.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Sep 2025 01:02:22 -0700 (PDT)
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
Subject: [PATCH v3 01/11] devfreq: tegra30-devfreq: add support for Tegra114
Date: Mon, 15 Sep 2025 11:01:47 +0300
Message-ID: <20250915080157.28195-2-clamor95@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250915080157.28195-1-clamor95@gmail.com>
References: <20250915080157.28195-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Lets add Tegra114 support to activity monitor device as a preparation to
upcoming EMC controller support.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/devfreq/tegra30-devfreq.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/devfreq/tegra30-devfreq.c b/drivers/devfreq/tegra30-devfreq.c
index 8ea5b482bfb3..d976077d4757 100644
--- a/drivers/devfreq/tegra30-devfreq.c
+++ b/drivers/devfreq/tegra30-devfreq.c
@@ -980,6 +980,7 @@ static const struct tegra_devfreq_soc_data tegra30_soc = {
 
 static const struct of_device_id tegra_devfreq_of_match[] = {
 	{ .compatible = "nvidia,tegra30-actmon",  .data = &tegra30_soc, },
+	{ .compatible = "nvidia,tegra114-actmon", .data = &tegra124_soc, },
 	{ .compatible = "nvidia,tegra124-actmon", .data = &tegra124_soc, },
 	{ },
 };
-- 
2.48.1

