Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5137C37FF6A
	for <linux-clk@vger.kernel.org>; Tue, 16 Jun 2026 21:10:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781644241; cv=none; b=ecio6EJM8HyCpttw39vB3XTGdmG/R5/EkaIya8qweT7Ck+J12i61XY7VaAYQYBnjULVFGYdZykr4/povvQKzp7E3qWFbiuEARm2FEmbQ3Jl0lJ5BE5xjyZg1EU3SGrcyqwT6uxpejM06JUfeot/o0q5xym1YvxMDe+wlIhysHJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781644241; c=relaxed/simple;
	bh=LB7cu0y7X7i7aLFAGQATmrNEtDSjcczHxFVVWqoV7B0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=pWaPNkM+3EodqdsOOigp+LWPPcCLA4nqj5lIMvMioUDb07S85YmuQFum8mQUtxD3kuWgRTxEvq9k0iou060FJV+wfr8B9i2ttikbWRJQKNkvxRnLSFaoa+OtpZcd/0atyUnrk8vGSaIgdyNQj/RPY+LJUHfq1x2jpZo7ZvqMw6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=AHzuREYx; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=jCcLnJLo; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="AHzuREYx";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="jCcLnJLo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1781644233;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=g7hkkPYTAo54xVvf7CutgDLi6l1qv7WwNcNRFYT9mDE=;
	b=AHzuREYx33TzzpXWFKrAbMCd630T1Tq/qKuJ/3Lq+Ftsm2xpO/g+3IW17bJ5K0J9iRe6SM
	7CZbHugFWYykWe87r0AjI9LJ2013RdB+6UJX6joHlxX198sfvYY+FU4d5yqVv0Z7h3Dkyd
	c/LmrR+flRQ5uHQ4Nwvs/s1IfnwVPAg=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-394-pX-RHp5gNi6kMhx_04E6Ag-1; Tue, 16 Jun 2026 17:10:24 -0400
X-MC-Unique: pX-RHp5gNi6kMhx_04E6Ag-1
X-Mimecast-MFC-AGG-ID: pX-RHp5gNi6kMhx_04E6Ag_1781644223
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-5195827a23eso71255531cf.3
        for <linux-clk@vger.kernel.org>; Tue, 16 Jun 2026 14:10:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1781644223; x=1782249023; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=g7hkkPYTAo54xVvf7CutgDLi6l1qv7WwNcNRFYT9mDE=;
        b=jCcLnJLoauAKFPpI1PSuBibcBAl4dS9pzktiRaxclkszv3RubOwdDvJmte5Safj3q5
         tnAEFgCSZ3CfgRYtWd/RLbM8BAgC3QalhES2QhdXJiGb0zjhD8UCcQy7NPNOHggKfAPN
         30dDnWvPwpVZSLqxgbSu83Qx2FbVVYVbrmaihCJISIqxDhxTwOXlZpzhj5gWKTuGwp9u
         figzK900EAAS+bsRhchHkiFAToxhFJYJ6xKpkaOzsT8MneBZj4EjdcTYVF8sA+8rrYdT
         V2BRKyxOFJ5NqjWvTIGpPtG9SUM12eY1whM3zPBgcP77Aqicsq+XMg5eUW2rLEQlnz/V
         Z68Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781644223; x=1782249023;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g7hkkPYTAo54xVvf7CutgDLi6l1qv7WwNcNRFYT9mDE=;
        b=q7H3KvAUBSuC+ZNh7s41kNSUEiLkUbVMr5HEjr8Esl0K3/6ZdiHTwB52plv5iLRkxY
         nwa+/w6Dr1B7entr+ZcdQeSxKYCATl5NkGR5X98Ppx0dAULrCfi0QdGE0owHy0V847jc
         ynQ+BjB4IbQxYHgH80+6yc+PUI0U4413Svm/d5Q4F+vW/Zl2+cp+qYtmg7CBB2MVXsz4
         9+BWytj4i522VWMomBLLnfV8miX4WEfaOM+XYfoHbAJAZqrPOMwrmOL5jq6H9ecURI8D
         mXBBvZsRSIw4OnftCt1Xcmdgp9c+2Lmm7N2tGUdsBJ+ocAuEtjR85EPW2d/o+h0R1Uyt
         4KjQ==
X-Gm-Message-State: AOJu0YyQ6eYNteCFLHydlg1wU0jzN7BkWg/S9zZDyfkhOoZvLcg27ANO
	Ld9tZEkCVCk24taKljjTDXak4jhpsqJUCedqD94Ht8ojpiNSzQfWEsopzCxLAXXL1/9GKiEkwhQ
	mXWSud0sUCxrR+87QxmtKlcDvqPtMb5lEpumwW2+5uvO4p1fP3cbvKyNW3qq+kQ==
X-Gm-Gg: Acq92OFr6FKa37h27zgjaFNovsAh50+Uugtdgfh0ff9TFsww8s1lvj+CE3RcZ8XwERD
	HlzP9evtQlmhnm9fQA3EL9fM+0AbbSMLxCj1wH5pFE2WvPIn5jahetxWtg2zhgXR0pMHZq8SdeC
	TgRHyovUGwLK21fASyKrZt/21tEPjyrihxbrid5jaB6+vFWjVqFKQ2rT5QxOrl7W6rdWhg2POTk
	ZFx3N+R1f7QMSGujsFNoiJrYMq2DIdOr1S10dmSD34sAxeeCltu7h2iCjbXXwV73YeEt2hlVb9F
	CULFN5E4yPKVOD4h2Lz0y+tAVLYp9i8kVY1qhhug7taWlHQg6qHGsRZX4RzmhXqMZExz+zxQdsC
	MeRitUlssqnsa3rhSZbbqlwaq9Shdhexxm465aTKYTcVj351L6tjNhW6/9MoKsg==
X-Received: by 2002:ac8:5c92:0:b0:50d:d1ea:65dd with SMTP id d75a77b69052e-519a8dcd1ccmr20911511cf.14.1781644223463;
        Tue, 16 Jun 2026 14:10:23 -0700 (PDT)
X-Received: by 2002:ac8:5c92:0:b0:50d:d1ea:65dd with SMTP id d75a77b69052e-519a8dcd1ccmr20910941cf.14.1781644223007;
        Tue, 16 Jun 2026 14:10:23 -0700 (PDT)
Received: from [192.168.1.15] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8d9f122b21bsm43742846d6.4.2026.06.16.14.10.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 14:10:22 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Subject: [PATCH v2 0/5] clk: implement sync_state support
Date: Tue, 16 Jun 2026 17:09:42 -0400
Message-Id: <20260616-clk-sync-state-v2-0-15f82c64d95c@redhat.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/13MQQrCMBCF4auUWTsynTYVXXkP6SKkUxvUpCQhW
 Ervbiy4cfk/eN8KUYKVCJdqhSDZRutdCT5UYCbt7oJ2KA1M3FFHjOb5wLg4gzHpJGhINWejVEN
 jC+U0BxntewdvfenJxuTDsvu5/q4/qvmnco2ErTrVTCIDE12DDJNOR+Nf0G/b9gFv1WMOrQAAA
 A==
X-Change-ID: 20260602-clk-sync-state-c0539c5530f4
To: Saravana Kannan <saravanak@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Maxime Ripard <mripard@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Russell King <linux@armlinux.org.uk>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Hans de Goede <johannes.goede@oss.qualcomm.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, Brian Masney <bmasney@redhat.com>, 
 Jens Glathe <jens.glathe@oldschoolsolutions.biz>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2218; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=LB7cu0y7X7i7aLFAGQATmrNEtDSjcczHxFVVWqoV7B0=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLIMd29KkefLOp3SwG+vvP42z+Ln81omJe14smu5QTR75
 /ZWodnZHaUsDGJcDLJiiixLco0KIlJX2d67o8kCM4eVCWQIAxenAEyE/wwjw59F57frl8R1h2kV
 fpNTrupJvefsGqevdOh8Z9muFd3fvjMy/HS0kF0+/VHiug6Ph4aR0XbvH593vRUzY85zpdlNB1e
 94QMA
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087

The existing support for disabling unused clks runs in the late initcall
stage, and it has been known for a long time that this is broken since
it runs too early in the boot up process. It doesn't work for kernel
modules, and it also doesn't work if all of the consumers haven't fully
probed yet. Folks have long recommended to boot certain platforms with
clk_ignore_unused to work around issues with disabling unused clks.

This series:
- Adds a generic clk_sync_state() callback that's initially empty.
- Adds a generic qcom_cc_sync_state() for qcom SoCs that need to
  interact with the Interconnect framework.
- Converts the 7 qcom drivers from using icc_sync_state() to
  qcom_cc_sync_state().
- Implement the framework-level sync state via clk_sync_state().

This approach maintains bisectability.

Changes in v2:
- Split out clk-cbf-8996.c into it's own patch, and don't call
  qcom_cc_sync_state().
- Clarify comment above call to dev_set_drv_sync_state() about
  the -EBUSY.
- Added Tested-by from Jens
- Link to v1: https://lore.kernel.org/r/20260603-clk-sync-state-v1-0-457120eed200@redhat.com

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
Brian Masney (5):
      clk: introduce stub clk_sync_state()
      clk: qcom: common: introduce qcom_cc_sync_state()
      clk: qcom: convert from icc_sync_state() to qcom_cc_sync_state()
      clk: qcom: cbf-8996: add clk_sync_state() call
      clk: implement sync_state support

 drivers/clk/clk.c                | 76 +++++++++++++++++++++++++++++++++-------
 drivers/clk/qcom/apss-ipq5424.c  |  3 +-
 drivers/clk/qcom/clk-cbf-8996.c  |  8 +++--
 drivers/clk/qcom/common.c        |  9 +++++
 drivers/clk/qcom/common.h        |  1 +
 drivers/clk/qcom/gcc-ipq5332.c   |  3 +-
 drivers/clk/qcom/gcc-ipq5424.c   |  3 +-
 drivers/clk/qcom/gcc-ipq9574.c   |  3 +-
 drivers/clk/qcom/nsscc-ipq5424.c |  3 +-
 drivers/clk/qcom/nsscc-ipq9574.c |  3 +-
 include/linux/clk.h              | 14 ++++++++
 11 files changed, 100 insertions(+), 26 deletions(-)
---
base-commit: 08484c504b55a98bd100527fbe10a3caf55ff3ff
change-id: 20260602-clk-sync-state-c0539c5530f4

Best regards,
-- 
Brian Masney <bmasney@redhat.com>

