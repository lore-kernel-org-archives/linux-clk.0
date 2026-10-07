Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BB854AF66B
	for <linux-clk@vger.kernel.org>; Wed,  7 Oct 2026 14:37:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791383852; cv=none; b=dOZx0i03ZXz8iUu0nwoS6mlevZEk+LkfQCMIDP0TrhpIztlOzlm1kl/oHH8FVoGjYMqRv5/DsakAfA4FYbSN8R9HR6OIraMF5QnukV/x2jaK7MgoYy23pRclZrGCkbaLLMS57kBj4s6QmDiWCbjuvDM3r+AD7yMy3qgHI3Z0Dk0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791383852; c=relaxed/simple;
	bh=whC7gmL15K1cWGuFXFgyqJ4Ch9Jx/fU22cEMTN48nyI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=uWdUNHf/B0tFuFN+Pp+e+I94mVfxoma4cDLYclS9v8g+BNS3wbrbam4w914nkm7OZ4hgnH359wTQUOXM8AECUsz8xCXpGMPbyMtdDRXWBNViSCem/oTeHvU38BLK6S0emR+u4CVjNg03NX4ieAozUOop3yIZE7W6fKU1vsCUSX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DSVoDILe; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DSVoDILe"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-3a80d1c98f5so2337793a91.0
        for <linux-clk@vger.kernel.org>; Wed, 07 Oct 2026 07:37:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791383842; x=1791988642; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=0LAcWUItTSrXRQ4sGStgckVn+Q0TtyeUBlb321VM6ps=;
        b=DSVoDILeE3RN1NH/0jLu48e4mF2Onq1/9Cn0O8c0ZEZbm1+azgVkKj4R7FXKMJSjZ7
         UcLSFy8tXddEe9C43St9Hd2Js4ZaEaUBVDepD1oRLdGbNVgdQB/WDB2ua+j+pQ7XDUHn
         F91U89uxKy03K/Ac+ks8TeNQ+2Ee8ZmKZHhmmIGBiN7zW3teEku1ihN2DZpHmZ1ZS+MA
         d0vCguoZIR9WTfZ0wrCnN1M49y0bCKo94u34E0vuvZoo/I5wYBwxpj++Pj48WfjiXhQf
         HJmllEBlJ1cUla2MKK6CQbk+0wxZhha1fc6g3dCerBWT2R8HbiAFIv1kiyTgasFA+FgZ
         jcwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791383842; x=1791988642;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0LAcWUItTSrXRQ4sGStgckVn+Q0TtyeUBlb321VM6ps=;
        b=cWYCpNXZgcje2Y8av+5S8GpCgjf74lnqg6eWYiCPZTaCnQK3iIVX/x97YJ4QTNC+pC
         6ZGHQsXwbxtzgPzI9nsTV7L5gZSqhCUUj2UPVu0CjPU9k6XfWMcIp4/9pBC2S3dhu9Mz
         pNpSn7gKwmOd45Gn+eRDkIPSTWqkpN1twkdO0dh80Z/0EVCiPtN/Y1e8Ktawdv0n4OUm
         tzq+6XW38buzZXPPGdIMuqnJ0jh98DmrvcOiHD8piU+a+CovtttcQIi5O4zUwFZeecD4
         RLBKPsxvt7N1AjIDsbK3Ffa+RFlAgFdaS9CvdUJQgFPw1hv/TIRem8Zij5nEpD5a260R
         tSIg==
X-Forwarded-Encrypted: i=1; AKwUvBxUSSb5Rsp2OYVW64bSxBL1FZ69/Xg4RGSTPCJYthSNBrpA2uPRqKMm+LmIOWbSyWC1FQuAXKICrdM=@vger.kernel.org
X-Gm-Message-State: AFq9FYLV9c1O6c89U1uuTxJMd9+2Md165ANTa1kjwbDrTwUL19ZwcfDD
	XFTC5RDvVED+DBdClkL7jDFV1O3JK9Nd1/h0r2rDao5KqAkrsf13Wwnb
X-Gm-Gg: AYBFou3hE2jqL0jt0oAWSnSpdhQX4OP5g5wvR71jeNN7DutY+nUwf0sY5xmeDv3bwQn
	d6J3WeiJj/axK6Nl9TOc5VLVO5ktdDfy7nFSf7JgmU/3X/ld6rL5unoXm7HCHpvE3maUw9DH9oo
	42H+wHgR5dOrbUIxn+5PlHhpR5PbdJ8lgSYmsLFuVx3nmuuFhC9ypvLUI4nHVqAM9jNIXegCKv1
	5vGHfkBDYY57EVqaVbQ5sBwzU6L9g13oY+y0iWSx2Zgu0lTkP9vVboNGxJxqjaEyDMxcc+X1b1i
	Zy9e6EFdvXaB5n9nmn7gtHA6c7Od6bmiXOOXSewO1C1yXgED1mt/DtmL3mNJkOgAu+xvHjfDQJ2
	BfThp6CZK1J9xm+4AiOCIwBXxj5LMqllLfXZuMMpzTjgXBA+BvH0sAShCoxGyLIrs12/ARBqsUR
	D6ZU0obksOt2zRdYnxZfy4/WP1zj/2cVV0gZXooIt6KXBJEV7WB5F6kkvtSi0D50F34UQeWdqHM
	cAEPp9Bex0U5K0=
X-Received: by 2002:a17:90b:4cd0:b0:3a4:7938:844d with SMTP id 98e67ed59e1d1-3a8a1ceb3b5mr2118343a91.64.1791383841385;
        Wed, 07 Oct 2026 07:37:21 -0700 (PDT)
Received: from DESKTOP-NM9EKIA ([125.134.240.130])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a8a4b1abbfsm1712246a91.4.2026.10.07.07.37.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 07:37:20 -0700 (PDT)
From: Joonhoe Kim <26rote@gmail.com>
To: andersson@kernel.org,
	sboyd@kernel.org
Cc: mturquette@baylibre.com,
	taniya.das@oss.qualcomm.com,
	dmitry.baryshkov@oss.qualcomm.com,
	konrad.dybcio@oss.qualcomm.com,
	abelvesa@kernel.org,
	bmasney+clk@redhat.com,
	jbrunet+clk@baylibre.com,
	nitin.rawat@oss.qualcomm.com,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] clk: qcom: gcc-kaanapali: Enable FORCE_MEM_CORE_ON for UFS AXI PHY clock
Date: Wed,  7 Oct 2026 23:37:16 +0900
Message-ID: <20261007143716.2161-1-26rote@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.5
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

As on SM8650, SM8750 and Eliza, the UFS AXI PHY clock needs
FORCE_MEM_CORE_ON for the UFS controller in MCQ mode. Without it the MCQ
configuration is lost over system suspend, and with MCQ enabled every
resume from s2idle ends in an SMMU fault and a host reset.

The UFS PHY ICE core clock already has the bit set; set it for the UFS
PHY AXI clock as well.

Fixes: d1919c375f21 ("clk: qcom: Add support for Global clock controller on Kaanapali")
Assisted-by: LLM
Signed-off-by: Joonhoe Kim <26rote@gmail.com>
---
Tested on a Lenovo Legion Tab Y700 Gen 5 with MCQ enabled in its DT:
the MCQ registers keep their values over s2idle, 7 of 7 resumes
without a UFS error. Kaanapali was noted as the missing one in the
Eliza thread [1].

[1] https://lore.kernel.org/all/a0b6030f-be42-4f5d-a59c-db78912ff0de@oss.qualcomm.com/

 drivers/clk/qcom/gcc-kaanapali.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/qcom/gcc-kaanapali.c b/drivers/clk/qcom/gcc-kaanapali.c
index c9473fb79ccc..6834f43b72ca 100644
--- a/drivers/clk/qcom/gcc-kaanapali.c
+++ b/drivers/clk/qcom/gcc-kaanapali.c
@@ -3484,6 +3484,7 @@ static void clk_kaanapali_regs_configure(struct device *dev, struct regmap *regm
 
 	/* FORCE_MEM_CORE_ON for ufs phy ice core clocks */
 	qcom_branch_set_force_mem_core(regmap, gcc_ufs_phy_ice_core_clk, true);
+	qcom_branch_set_force_mem_core(regmap, gcc_ufs_phy_axi_clk, true);
 }
 
 static const struct qcom_cc_driver_data gcc_kaanapali_driver_data = {
-- 
2.43.0

