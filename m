Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E7CC2737F4
	for <linux-clk@vger.kernel.org>; Sun, 21 Sep 2025 17:59:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758477547; cv=none; b=SC5YjYPlQDluSfwkmDWiigaJMOITJwYyzgzVRp6eSQw+JK6biIF0oDmhd4pwg2/xHT/ql11kFI057H1GwyezuHHGJbaacr1Qe2KmdG4Xiu755xKVnouzcDL8SRDsCSQP7PXFDm/PWrmztE6GM9F8shvmZbd4TeZZDvC0MZ+eMTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758477547; c=relaxed/simple;
	bh=5JC0wL/8iPQ4ecKyPVdGw0veg3faWdX+l0jdkzWeAhA=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=UNghwF7CJ7r0aWdEuZEBno0j34qf2f9noMkeD908MJNXmafi9oqFVCnIBpFlyHeSkfBIqB4O+kBWdAq37XLgNeND8w3DCUkk5vgaX2d9d+JgmwKk5v+BVwCCJqkATA452+8znEBugqXdTQFCCHzwac6HXZvOeyQsE1iDudDI9fY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=dRgNmK8v; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="dRgNmK8v"
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-b5241e51764so2913887a12.1
        for <linux-clk@vger.kernel.org>; Sun, 21 Sep 2025 10:59:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1758477546; x=1759082346; darn=vger.kernel.org;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N7N6w84tes+OnzuskxkGRs0hmNPgasERO4DjEJx5NcY=;
        b=dRgNmK8vgkf5kyFDPi5H2UrQYBhIWIQrIU/QB0fTaFkYFJg/uPVwInw99pOzuWPoAi
         PB02aldwqWAQwSDMJUiu40Uic9Apdm8vLiWHdMgDrZYSbGacJXufGtccziQq1Aolg0p/
         MRsJcH9qs/bDRLG+M2mAX1V3kmFBec9OUOrEL09TgLa7IInleBVmmXDKxOwawpJbQqDH
         J7Y4OvBLvewOT0twzewpHWsD1g227sc7z+RwTCOKANyDJEsk3PkZJ20RcVyiKore4rBr
         SJOXnLGoUQWDq+qiqy6kHWKznn1LSPBgzo0MfdRfGBx3oE/VoqkpTpRhUsLZA539u1t6
         Mu3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758477546; x=1759082346;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=N7N6w84tes+OnzuskxkGRs0hmNPgasERO4DjEJx5NcY=;
        b=TJlwrSLIWlXEpxwhujbCNxNt/xishyMQGqM94pPy6QY1wJZUrcsNZ996ZNb/5sceFG
         7mt0EQarqVCpUrHRUS37Hl27/TNlmoou/oHakjFCZIlxPFYMNM7+/AXtM4Iix57l/TgM
         VTZmD9VafQiONbjJscrEXcktH+8b+DHXJKAa3a6UN62+rNE5JIvLHJxv9gJpfQN3n/jl
         f60iVdJxytb7VTpW4/y4HUSZNndwy+Va0dmXqTI+EvMczlqRF10bpC7kHwTeSk8zDxWF
         fVHrG4GIleZyS3Xeqle000XJAFQGPNEq8VOeAPbB9CbUW3+//aa1t0fSpZggItTZ0NuS
         9oPw==
X-Forwarded-Encrypted: i=1; AJvYcCUYKsmeV5eilcaQ5fH9suTSYWr4JBn7IVPnyISXVS1KKuMlBxtvDiEQ9mvbaePMeXe7SGblb/1Dl1w=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3/FVr6owMHv7RrYFx2D50L9r7hZuJ1RJKHVgLBwTOK4rLcF46
	5q6ivdiUe0vBB1tdyGIx0lvXHqp4MB7UtKIBCzZOHm7kBnRNywXdH0PXHWFlgREt55CvKusZ0wZ
	cuFZlH5U=
X-Gm-Gg: ASbGncv+tuEQ0mk6G/pMb7wPyHj+yTM0N8NpgFSLY908beDyDFMpMtfuHKgsp/tdb1m
	FVbAf2VHzsn7W/SgTHlOH3ensE0UrvNUO0wJvqz77ER8uU6j0ZSfSjj4c2uKOIhXuGGWxCbhtOS
	Gb+f74zi26TI0DfaJuaL3w4Dv+1VBDs8AdcjDV+WzWKRRiEy0qFw1XQYgntBdhtFaat2nHjkHmS
	HlVIZVDE2IXSxQFCd7KekoNMz9c0Z8PBVBl/Yoxm6hE5ZNWa55l9C+2Nx5MGbDrbeMiQ/vRi2sm
	JrV2z6CCrwu8FEMNouJBIhwZwQCYVS7RcW9u65njwOoTGFumwKban7cVgTVvLKaIC8TkFUwiOey
	j+t7LiuEvoALd2+y/
X-Google-Smtp-Source: AGHT+IE4N5yVfckWwYxpfOR9KawnJzCzLvMHSqQ7ZC09qqy67AOEHN9UFXchXCtf4BOafodVIJj8ZQ==
X-Received: by 2002:a17:903:3846:b0:24c:82ad:a4ef with SMTP id d9443c01a7336-269ba511744mr153063005ad.32.1758477545833;
        Sun, 21 Sep 2025 10:59:05 -0700 (PDT)
Received: from 166871acc15a ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2698016bedfsm107308875ad.32.2025.09.21.10.59.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Sep 2025 10:59:05 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [REGRESSION] clk/clk-next: (build) use of undeclared identifier
 'mtk_pll_round_rate' in drivers/clk/m...
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: gus@collabora.com, linux-clk@vger.kernel.org, sboyd@kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Sun, 21 Sep 2025 17:59:04 -0000
Message-ID: <175847754379.596.17428947742119998412@166871acc15a>





Hello,

New build issue found on clk/clk-next:

---
 use of undeclared identifier 'mtk_pll_round_rate' in drivers/clk/mediatek/clk-pll.o (drivers/clk/mediatek/clk-pll.c) [logspec:kbuild,kbuild.compiler.error]
---

- dashboard: https://d.kernelci.org/i/maestro:7b540b5ad3c86a154ae7867284b0a7da95bc0eec
- giturl: https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git
- commit HEAD:  146bd480c1bbe9d01e77b3a97e256212a12d2a48



Log excerpt:
=====================================================
drivers/clk/mediatek/clk-pll.c:320:16: error: use of undeclared identifier 'mtk_pll_round_rate'
  320 |         .round_rate     = mtk_pll_round_rate,
      |                           ^
1 error generated.

=====================================================


# Builds where the incident occurred:

## multi_v7_defconfig on (arm):
- compiler: clang-17
- dashboard: https://d.kernelci.org/build/maestro:68d039c975b320799d353ae5


#kernelci issue maestro:7b540b5ad3c86a154ae7867284b0a7da95bc0eec

Reported-by: kernelci.org bot <bot@kernelci.org>

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org
