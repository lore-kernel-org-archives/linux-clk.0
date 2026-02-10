Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 007A332C923
	for <linux-clk@vger.kernel.org>; Tue, 10 Feb 2026 05:41:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770702065; cv=none; b=qZFmOq2GFgYyR05jkzd3nXzOpcsGwPACwxo+ry+moWIXGx2NG6zTU+W+fip6Cca5sxCOOLReHE8TuR13s7UHc0Xi9ado48C9u1INCeDmTqtzdHg4NY18U/A7/CfGzsimIXy+IP2hS3XPgyS15tKQXCLwQUTyE+WN5WXlG8BtWV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770702065; c=relaxed/simple;
	bh=uH/E9kM6ANIRRx8ldFYBbMd0JyWKxtDcLX9zUO8KnuM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LgSaDG0gC/EwpC09KMLDyloVSVcUuYdi0kKZ3Dtd4m0csx89P6+ytWW7Ei5H1HYiV0pE79Wmo4z/O7e5Ws47FBz3yHCQgWWd00IVGJw3T5tO4SbGRn08COV9kx/sYFW0Zx/PL2exyNB8+05LKpB0LbNibKJS6GA1+38wsf4ljRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UPsu7CcP; arc=none smtp.client-ip=209.85.219.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UPsu7CcP"
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-8946e0884afso71077746d6.1
        for <linux-clk@vger.kernel.org>; Mon, 09 Feb 2026 21:41:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770702061; x=1771306861; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5UsweLwyiRceTIoKAfsXCtIwJ4N/M6cF1VZ5rClDl5c=;
        b=UPsu7CcPOs6hKhcgHoCcKWeYn7P71yaRaTW+Am6RSFqS2N9+0ymjooxtGqZ7Qv5t4b
         Ea+DBCbd0rmPwzRAEKGb7NZ/xCG9uv+wSWR2n/3ODCGZVwrYzcgKKrd6VSlmgE4BDkbl
         lduHxi4MfqGaQ9HSMcyQ6QuxKUQWYgE8lEbMGOC+KRYsA5a1CtNOkiFy+gOaBpNtUWcD
         3A/Ojwr0smCxqmN8XVu3KDHf/omv7Lfv1IFL05uymmPWyvKEjtgZzGrZthGTFtei7O7Y
         pxfBf6nuYszReqhf98nrf21NQMgj5EX3HXAwSgL6DYGiW148qLfJSJBQe6VwgwI1gEWV
         POLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770702061; x=1771306861;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5UsweLwyiRceTIoKAfsXCtIwJ4N/M6cF1VZ5rClDl5c=;
        b=f4axfROh7GEAlfeg1Xb+gqvbKOuUPjmVYhS5Ogul6uwOaaY+491lU1bdAOB3Lbew0w
         WJ9xY6og7ehg8XCvn+YeeyPdFN8zeHFUAUMxT3areh5mez/mUEYvdDSHBP3CN3RaQbjR
         eDB1agbrqZXWFqNDaP3klMOot9KXy+EmopgLrfuM66EX00nC/xQoxRj6i1eBlP88cqXC
         spy4mobW5xhFQ4b6xGSbRqtCyqU4jfm3MkpCPJ1vpNFgL8v3oK6O1icF0RlfVVRUKHUl
         hEDiKzesgATYUBuucVxrNudMBt7bWVoNL4QNrJ9sn7KwytAZo/v+/fYpfSmBqoeBF9NW
         3MLw==
X-Forwarded-Encrypted: i=1; AJvYcCX2gmuNrjj0joWK/Y2GqrVzudXbmPYIByRLa6D0P0iLyBHVESwEMr/k7jfVXZVTVqELZ/lUYKsLTE8=@vger.kernel.org
X-Gm-Message-State: AOJu0YyFK3Zas31hhMqNQDpMykL36IZvY26Jz0lkH79b8IxBNI9R9oIB
	zpIW2HW7yfadM5OqJS10JolOzj/AA+xCFgcAdrsK+Tb31K63THRUHaZp
X-Gm-Gg: AZuq6aJH+PS60uqpEHIfQJeFMsdCEmyYWeRFQmhB6KFutZLJ0gT2Rw8lj19SrfBnc7+
	iQQLEOHvBr+VyWxmQc8a9kUkGTLc/kO2frb+lB67E7VPSpkz4RN7rH4sIfBF+JwAZToO+ulgoWo
	3NmK+sSnt/fgmwk3toqIeiU5TvSYPxM+rOg8XCISoPnvABfaLp0KKUTf5eMBRJ372uJeVe1WNDv
	oJT+VvWfsaRyzUtOSSBwRRx5v4NSQMiOjzHtkK6ET5x1JqIiFs/5eYHv5t847miodRGsSmUPluj
	5d1cOaxf2J/7nddMa/xpRKJdszl8Z0D4Ln+vr0SFCfUVvH3ONY26/MV9EGITZXBn7K+esWH/MKb
	I5oOwDKUR1A3jCiIkQ7Kt5gbczeHwTLG+DwQeEyVG42SxfnPDWBdTJR+svPAvLduor4mjywZxhy
	M1V7ht0nroKPKI0tPMmlQibQSPCrhVdun9Ky3GIq99dSHD8j+ZI7CkiBY9XORMud5VyIt8ka3AP
	XiSXXW9/UzA
X-Received: by 2002:a05:620a:4708:b0:8c7:1952:789f with SMTP id af79cd13be357-8caf16e9e9emr1736522885a.71.1770702060868;
        Mon, 09 Feb 2026 21:41:00 -0800 (PST)
Received: from aford-System-Version.lan (c-68-46-10-116.hsd1.mn.comcast.net. [68.46.10.116])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8caf9ee9fbasm978632285a.39.2026.02.09.21.40.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Feb 2026 21:41:00 -0800 (PST)
From: Adam Ford <aford173@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: angelogioacchino.delregno@collabora.com,
	Adam Ford <aford173@gmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Laura Nao <laura.nao@collabora.com>,
	=?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-pm@vger.kernel.org
Subject: [PATCH 5/5] drivers: clk: mediatek: Fix error finding regmap
Date: Mon,  9 Feb 2026 23:37:05 -0600
Message-ID: <20260210053708.17239-5-aford173@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260210053708.17239-1-aford173@gmail.com>
References: <20260210053708.17239-1-aford173@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The clock driver for clk-mt8196-vdisp-ao doesn't use the same common clk
functions that other clocks use.  As such, this clock returns an error:

  Cannot find regmap for /soc: -ENOMEM
  clk-mt8196-vdisp-ao 3e800000.syscon: probe with driver clk-mt8196-vdisp-ao failed with error -12

Fix this by using the common clock calls.  With this patch, the following
new clocks properly enumerate:

  mm_v_disp_vdisp_ao_config
  mm_v_disp_dpc
  mm_v_smi_sub_somm0

Fixes: d4fb7e15a520 ("clk: mediatek: Add MT8196 disp-ao clock support")
Signed-off-by: Adam Ford <aford173@gmail.com>
---
 drivers/clk/mediatek/clk-mt8196-vdisp_ao.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/mediatek/clk-mt8196-vdisp_ao.c b/drivers/clk/mediatek/clk-mt8196-vdisp_ao.c
index fddb69d1c3eb..070c60f40b64 100644
--- a/drivers/clk/mediatek/clk-mt8196-vdisp_ao.c
+++ b/drivers/clk/mediatek/clk-mt8196-vdisp_ao.c
@@ -67,8 +67,8 @@ static const struct of_device_id of_match_clk_mt8196_vdisp_ao[] = {
 MODULE_DEVICE_TABLE(of, of_match_clk_mt8196_vdisp_ao);
 
 static struct platform_driver clk_mt8196_vdisp_ao_drv = {
-	.probe = mtk_clk_pdev_probe,
-	.remove = mtk_clk_pdev_remove,
+	.probe = mtk_clk_simple_probe,
+	.remove = mtk_clk_simple_remove,
 	.driver = {
 		.name = "clk-mt8196-vdisp-ao",
 		.of_match_table = of_match_clk_mt8196_vdisp_ao,
-- 
2.51.0

