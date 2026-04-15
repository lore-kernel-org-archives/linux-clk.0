Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C92730DEAC
	for <linux-clk@vger.kernel.org>; Wed, 15 Apr 2026 20:32:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776285124; cv=none; b=DRRv92UFn0zgsijg1DGUPtToX8GAAIdlWDid/ndPEIDgyQImGw7L6Kyq6qHNY1obyDKSH/2XwL/nNB6xDxnqUjapr4Fs9li/kMVJxqDkPOl9W4/Xd4XaH9wmGiHnI9i+J8TcEE0JLAFmxJckgIHEHqHGEqORudCK5oonuJbPp5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776285124; c=relaxed/simple;
	bh=I6GWle2A9JfWyT414rmmt0LJ6IS5rwyHqfKG/gDyJRM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=XcHFZyELouoSno1HWAc5yyp+LRdWQ01YeN3Rr5LkGm690ZU0HU+P7HGwn6LSijTVXWsqZkI3u+HBvwwKlbLeFOnFqAGM8w0/+gSI7T8IBCtLwzShRmsuAIxCiIAMPovGVRKATrzEKA71Lis+NRV9qYDoJJZ++LaH5F5mhFiUs9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=dZCOj6So; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=Bsc2hL8z; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="dZCOj6So";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="Bsc2hL8z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1776285122;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=6diQCnV/W5pf79C4Txi27rTrnOikjq784dpHrcyUBzk=;
	b=dZCOj6SovhM2arSuusTd7K1766Rer3oKL9vk0hKmccs9jCf+sIORAQzqyc0D8q9litchAT
	71LtmmcbT6XGacYaXSoM+xygG51q6Qu938X6gmEm/G0nUwVrBrF4lpHJizs6OV/MnbCU/h
	1vINJ9nrH7hfnOXM/3llcULAf2UUKgc=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-681-YfPr-01fN_6T4BIRAVxzOA-1; Wed, 15 Apr 2026 16:32:01 -0400
X-MC-Unique: YfPr-01fN_6T4BIRAVxzOA-1
X-Mimecast-MFC-AGG-ID: YfPr-01fN_6T4BIRAVxzOA_1776285120
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50b4987c698so197204531cf.0
        for <linux-clk@vger.kernel.org>; Wed, 15 Apr 2026 13:32:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1776285120; x=1776889920; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6diQCnV/W5pf79C4Txi27rTrnOikjq784dpHrcyUBzk=;
        b=Bsc2hL8zR8MSnsM73pHjNGPrkAMBhVK06GaRZProlRgOkPKuI9s3I0DcLPtgHB/ssJ
         8OwEnplqOg1vCRbpNg6xc6S533khNfDTr2n8s3gbvytoiutG/67NbhgL4Osdt8bBSyFN
         Wf2pRq1DDemln+gDa1ioMeuDTBTXgzC0o6MnTBBwNhqwjUO1N1mUplOI9QEJo2mvjkhu
         BzlvklJmqE+QJLjfwPmuFLSDBUdMul9DsWnmwI27lLtB6R4FjzTY+NQzFMs3cI17Ug8D
         z3NDGLiqjIRh++8L6x3z+FkMeTtuwPQxSiIQNeUSQf1hIaoGkahCeYlbrESEDtYxyglo
         wKqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776285120; x=1776889920;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6diQCnV/W5pf79C4Txi27rTrnOikjq784dpHrcyUBzk=;
        b=KqqDD8tzrqDqxUO2vQgqr0306PkO0FqISb6+PlH5gRIcOFG70CLP1Idfe8YSnkTykP
         2m1kZ+1fxCjE3fcllTbyohVm3VZXfwoyizNBAwHTmYo2maDj/+Sf8QxK6LKfz8ubcEjI
         ArGqxJ/ma3GqUy2frxhJHhtDZDt7iD/AVZkSY19iDa9tQqWz4G6xSU0dcwod9Xq0IbEQ
         qwrUb/nGH3A9H+aR/VyPNTtDEjP7swpJEr1ni49lI2tUCY+nsfcICKGkDO8MTm6MCZlQ
         7Cqzf2ykOx6nC3/U0xch9S6cuKLVFLlRzR7VqneS23BCeAlyK/k9CEGHWntgJu2NVO8B
         Kd7w==
X-Gm-Message-State: AOJu0YxSDGyZKGmRxY1XqnSt643LtRRO7EkJ4AqU2qs/XN9/LqqBVEYX
	07kJzBpv+bR/EIuARxtK+xsgAsYduPgHcvwnh4Ka2l6lnwOWpaDRQQj+3kRwfuEWuQ6bWfPIAXj
	RXI6IKZic2LlZX9UZx6WDalfQztv6wU9bhrL5JHfCnLTYToDyDWOUO7hR73tbPA==
X-Gm-Gg: AeBDiev6HQ8fi2Wy9zoS/RJ59HGJIrlz95FKIcvQd6sE91Ss6wdNA6EGlLfn5czvoUA
	Q5Z9RGqSsxnwCaadU01mjgZ8GNi3GWsmQt9Fcxp/ZOuZMYMMDMtl3w4nm3tBj6LwQ5GQa9L4jKz
	VgZXgBwUs45lhMwz+2o0pDoUKlkoNJnUVjxFTIQpX7s/6GwffDNt2CeaO0dLPtljilFBnLHleE9
	EycxWhcLtz48J83nnTZhASiBj9m+wtMYKpU5yINszvJ3gdO4HQMnzkjiJbWaIl5dbBSxni/GYjN
	bBTuwdZv9Tt2Vi5uMcKSaU2ufUuFlFUamudvjt53y8VGeGMxWpM1KDytz027rxs1ur+LW7fxGmu
	xavX2CC3YSeG7t203FleSdVGBXUeBHDqTiikSjKpvCK5FBhsyaRvW4RrmbnsG
X-Received: by 2002:a05:622a:4603:b0:50e:18f9:b5e2 with SMTP id d75a77b69052e-50e24abd30dmr12845881cf.6.1776285120367;
        Wed, 15 Apr 2026 13:32:00 -0700 (PDT)
X-Received: by 2002:a05:622a:4603:b0:50e:18f9:b5e2 with SMTP id d75a77b69052e-50e24abd30dmr12845521cf.6.1776285119954;
        Wed, 15 Apr 2026 13:31:59 -0700 (PDT)
Received: from [192.168.1.3] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-50e1ac0ca45sm24372961cf.0.2026.04.15.13.31.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2026 13:31:59 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Wed, 15 Apr 2026 16:30:49 -0400
Subject: [PATCH] MAINTAINERS: add myself as a reviewer for the clk
 subsystem
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260415-bmasney-clk-reviewer-v1-1-49c71082c973@redhat.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MTQqAIBBA4avIrBvQqJCuEi00pxoqC4V+iO6et
 XyL790QKTBFqMUNgXaOvPoUKhPQjcYPhOxSQy7zShaqRLuY6OnCbp7wA3RQQKuktsr11mgJiW6
 Bej7/bdM+zwtRFy6qZgAAAA==
X-Change-ID: 20260415-bmasney-clk-reviewer-b108b1dfba80
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=938; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=I6GWle2A9JfWyT414rmmt0LJ6IS5rwyHqfKG/gDyJRM=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGDLvf93z9cMsldsWtu9CH3VK+W81O9S9/+Y1YZkAh9cuE
 y8HJenP6ihlYRDjYpAVU2RZkmtUEJG6yvbeHU0WmDmsTCBDGLg4BWAiJQ4M/0PaW//ZXP445/H5
 M8tCNvPU99yb1HimUeDNlSUfdolPXLGS4Q/n5NObfrwWMzngf1WjxFfwW7+PotQU8XrGuYtTLbJ
 5FzIBAA==
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087

I've reviewed a lot clk patches for parts of the subsystem that
typically doesn't get much review. Add myself as a reviewer so that I
don't miss anything.

Link: https://lore.kernel.org/linux-clk/?q=f%3Abmasney%40redhat.com
Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 8d3c599dc118..afe72afa7e19 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -6379,6 +6379,7 @@ F:	include/uapi/linux/comedi.h
 COMMON CLK FRAMEWORK
 M:	Michael Turquette <mturquette@baylibre.com>
 M:	Stephen Boyd <sboyd@kernel.org>
+R:	Brian Masney <bmasney@redhat.com>
 L:	linux-clk@vger.kernel.org
 S:	Maintained
 Q:	http://patchwork.kernel.org/project/linux-clk/list/

---
base-commit: 936c21068d7ade00325e40d82bfd2f3f29d9f659
change-id: 20260415-bmasney-clk-reviewer-b108b1dfba80

Best regards,
-- 
Brian Masney <bmasney@redhat.com>

