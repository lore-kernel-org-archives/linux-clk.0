Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52C092FABE9
	for <linux-clk@vger.kernel.org>; Tue,  2 Sep 2025 12:18:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756815494; cv=none; b=Q6E+zDDR3DcZFEeWT5UR0VUFfyPNQQoZmxOuMZvZMsMySfLCuOoN2UuIWDIv8Y36lOh1rzpBd/oWDVNokcu7bHnv2boUvpcmizpAiEuwXUhmi/xj85zyPzOUPuDW3FNfDE2E1KDXauQH8py3Neu3ua0kCh4J0FqFQuL5IydjNkw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756815494; c=relaxed/simple;
	bh=iV9OOBcP8NNsmpN1fZ74F397+PanErPMHV3l66Lj7mw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NnHtEMr8J6MJbuoA2aMyHzbfp+qniTfDJbo4ECOGFg0bziWqvdiVuVNwbi1xkE+VJuTp7LkLYx5EU1F5mqKAo0kEcsqPKIvBU7nbbJ1W7XvBi+Xg51O0XgJVetbGxoNGT3N014xvIVQafoi1Jha/ADr/k/Q1w3CNzxaKRnGWF5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=h7s22P4q; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="h7s22P4q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1756815491;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=OYbm++mLFAP2eOBK8zrIZwtSqYqUCZncQQAHIfNeOB8=;
	b=h7s22P4q6Mqh5ELUOM0ZFIcvvMNpESHT8cAn+XNmYtuLV5ggXZ47ep83+dePzdw5X14vAt
	NRgsJhn0OrENMczSX+jA3OdXrw9djy0W11KfunvvGhCbv+VRWGUT0j7DKmJPDKe2QmPTTp
	F4VZ48qre8Rg3R7fkF0b78E9VF8PUig=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-358-QnqHyp6bOBSLg0fS_gBEEg-1; Tue, 02 Sep 2025 08:18:10 -0400
X-MC-Unique: QnqHyp6bOBSLg0fS_gBEEg-1
X-Mimecast-MFC-AGG-ID: QnqHyp6bOBSLg0fS_gBEEg_1756815489
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-45b9912a07dso3794865e9.3
        for <linux-clk@vger.kernel.org>; Tue, 02 Sep 2025 05:18:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756815489; x=1757420289;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OYbm++mLFAP2eOBK8zrIZwtSqYqUCZncQQAHIfNeOB8=;
        b=FKKjhltNufz9GzFmwxmg7bPB1371WNQsOdi5UaiBWt01cxVw80HBQ0H1Dfe1ADP+AQ
         RvZ89/r80jLTq+BsLzd2Q4Q1pHY3CXFmvufiNHb11Pgmezq7u/l9Hwp2dDlGU4mF3j6E
         ouByg0grRRgh+/KNyMrnUpgsUtnz/V25E6HkZaWs5DwLMsEeWmJmU66SHjaBWs5kBW9Z
         joDay9VkAAW7v1qreH5WeKHS/zzCEy/3b6dOOopJ/JPzQ5xyEav9JZf5EA/KxPPmHZ5v
         Ij6Njni5Gkn1xg9VJExSenjLDPpEfJeG/chZzBLSjv/e+mbpjTsZiMSuM+FIs3ZPCo6N
         k0Rw==
X-Forwarded-Encrypted: i=1; AJvYcCV/JEB10bDWm4kx624UEKHCwHXCDoBXvZMpwNba7wBvCb9Tg8vVP6VRkNnu8fmk8a6q4NCNYYshR7c=@vger.kernel.org
X-Gm-Message-State: AOJu0YyIp6girulA+iVMgyxZstCd17h6RG80lfHpnNA+F1O/aRldE1la
	BX5EHOdpA2apQ05u3AfPq8Apv/WoOPaq4dYX7btPKG2MDuV4W35moPgTnYJyLsLLTOvBZwsFgIO
	NDe5UQeEMYzslUplCGFU1X1ATgcmO3tw4s3OMWMWyisEWsCDpOMS5SHocc7E5cQ==
X-Gm-Gg: ASbGnctL/G7hescvaFqTn4EQDYxASw1+AQ1mI5NWJYSZB/NqVoz4PP5O3MvTGKRk5z0
	YipWy9QYsdcRKs1eyMkTsGRGzXId3ATO/7WKtG/V/lCrvhXkH5p7W6qIc8LIAY8rbvObCpAW/BX
	8QrOlxULpR7Y3mKQOzRiN3/ZKfxwsC4GSIDCDrDt98wqi5jT8XC99fBOqfs+mkAUYxBHCmsdI8p
	3bUPPgXTvBd8y70QzNau3Ja+9kvxEvI8kYSdyhlpnfW8x3W94UhJ4lNUia5/Puu29KS08FkyIaG
	PBdS020Zjukj/Vtkvs6tCFmDod6J4qjPNJdtug7SCNjW3wvB6QwqwPM6ZQwJVVBFgVNbEyCYakI
	ZdISwkaROP3rS
X-Received: by 2002:a05:600c:4ec9:b0:45b:7ffa:1bf8 with SMTP id 5b1f17b1804b1-45b934f6a56mr31212055e9.23.1756815488663;
        Tue, 02 Sep 2025 05:18:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEjWniM8t87MstmOKseixN3K4oxvQKmIMmSp/10Fw9hcxqnkqnioeD1dS7AiZVevFngzZ7ccg==
X-Received: by 2002:a05:600c:4ec9:b0:45b:7ffa:1bf8 with SMTP id 5b1f17b1804b1-45b934f6a56mr31211795e9.23.1756815488249;
        Tue, 02 Sep 2025 05:18:08 -0700 (PDT)
Received: from lbulwahn-thinkpadx1carbongen12.rmtde.csb ([2a02:810d:7e01:ef00:ff56:9b88:c93b:ed43])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b7e7fec07sm191441215e9.10.2025.09.02.05.18.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Sep 2025 05:18:07 -0700 (PDT)
From: Lukas Bulwahn <lbulwahn@redhat.com>
X-Google-Original-From: Lukas Bulwahn <lukas.bulwahn@redhat.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Taniya Das <quic_tdas@quicinc.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lukas Bulwahn <lukas.bulwahn@redhat.com>
Subject: [PATCH] clk: qcom: Select the intended config in QCS_DISPCC_615
Date: Tue,  2 Sep 2025 14:17:54 +0200
Message-ID: <20250902121754.277452-1-lukas.bulwahn@redhat.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lukas Bulwahn <lukas.bulwahn@redhat.com>

Commit 9b47105f5434 ("clk: qcom: dispcc-qcs615: Add QCS615 display clock
controller driver") adds the config QCS_DISPCC_615, which selects the
non-existing config QCM_GCC_615. Probably, this is just a three-letter
abbreviation mix-up here, though. There is a config named QCS_GCC_615,
and the related config QCS_CAMCC_615 selects that config.

Fix the typo and use the intended config name in the select command.

Fixes: 9b47105f5434 ("clk: qcom: dispcc-qcs615: Add QCS615 display clock controller driver")
Signed-off-by: Lukas Bulwahn <lukas.bulwahn@redhat.com>
---
 drivers/clk/qcom/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
index aeb6197d7c90..823125f48346 100644
--- a/drivers/clk/qcom/Kconfig
+++ b/drivers/clk/qcom/Kconfig
@@ -504,7 +504,7 @@ config QCM_DISPCC_2290
 
 config QCS_DISPCC_615
 	tristate "QCS615 Display Clock Controller"
-	select QCM_GCC_615
+	select QCS_GCC_615
 	help
 	  Support for the display clock controller on Qualcomm Technologies, Inc
 	  QCS615 devices.
-- 
2.51.0

