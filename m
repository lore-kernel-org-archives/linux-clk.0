Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B6C61DE8BF
	for <linux-clk@vger.kernel.org>; Mon, 11 May 2026 03:16:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778469367; cv=none; b=aZqMN1ecB0EdhOZdevUhgucWoy20Gk7NkCbmpV/I6QRdb+ueaksyKkyH6VUywNiBQpold4sDRhi1IUBTnuJencMnJhqegMh1HwMPu4c5Ay4bl++uQB+dw2M/Yzj2lOflnNA/qnFF+RlQW6EpqWClnkJ6GXXZyiYOBXAR+gizccA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778469367; c=relaxed/simple;
	bh=T3ybIGobGMYM+a9OaJ410iNkpJve8tY1LDQX2six63s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NW3/RB6hrvfxp93W33DH6pDueW4B+7hBxp+WsrWkOo9STyR/8A1SP58+DS4Oe2sQVuVjitCLnin63lMDML1x5gpBwlI9V/b1iwfTOMJxnxx14kd8F24gSbJvIxtZlzXRjBJrFkpZ1DIMGZ+qPkrm9kNiVlNLaV3NgQohqA07USc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kTJnTiKf; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kTJnTiKf"
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-c80148ae949so1572560a12.2
        for <linux-clk@vger.kernel.org>; Sun, 10 May 2026 20:16:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778469366; x=1779074166; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cpyMNVLiIt/MKd5auuA+yMznLxqeT0beCG+PUpZtsJs=;
        b=kTJnTiKfq5HzPYmARSWwWMaFNQwLcbVur4GaEAdcy5DcO0oeL0h9qChvOCmhKC0fPm
         690gstmgDeQbc1WDxS262v1UoM2bgCCxIjQJ/O+ltO/s2t0hoxj4c6A8ubP6ptgQkEnq
         zP/+HOgbHLn13Oqdh1UT7UfhFMh5LRjpoWpoudZHkXpW6vfmEK0mP8sH4EmxvK0sWkr2
         lTxs/X5b+F5EfUZfmArVMtyni1CTvs2+cR0+gPCBTPjLRSiNpM23raWDZtTW9C5jp4go
         bPOU2Aw0VhDEeKi9zXiB1RJSZxQDYaCdtAwGcEIa7GTqXtlC8Uqelfa/6yhzgK0s71an
         4y8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778469366; x=1779074166;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cpyMNVLiIt/MKd5auuA+yMznLxqeT0beCG+PUpZtsJs=;
        b=dNnA4eIjMD7eEQUuFnSohnvqxqwZUpL1y33dIImlE5S5XFVU8dp4NM4idqo5WwA4oH
         u6BsuNGWdYwyxFl1VsyRIIkkBeK4h7RYOgZiPaiE+0uZd0OX3pPIAupelcBHideaRIt/
         s+WNqNsCfXVED3MLHMkAxo0MpU8LF4qW5KlWseEFCVXSi2GGn11MMF9XvIjvC/Q3dOYt
         VGlGCd+e9PZTV8FqDOUeprU3TDw2SpLo1SGse/mSeJGLr40d/yi8Fb7aqNxU5veF6xy7
         iJf9EDj6ESIwj4Li/YnZ7MtWutbZ74ZdTjM/q6bZbgViMXhhtulzyaImBu+LLdZUt+Z+
         DFiw==
X-Forwarded-Encrypted: i=1; AFNElJ+QAuzr5QGsSuRgR20klMFr63804Yd7MTMH5ztqJV7FuU1UyPH8woP2xZTk4runRHThZqx3HgORZhw=@vger.kernel.org
X-Gm-Message-State: AOJu0YxwD5ggsGtrT3cjHtD2Gyrde62xWYc88fDia3JvzDtXgR6V5gCR
	WaV2AqHOYmIk5JAQmTHd+grqaYv12iGSGvny3RzhpbTMsfjJ9l9CT9tv
X-Gm-Gg: Acq92OEC7pRk/6NHeaMTstVWdpYS/pIdMHOVwSimIdNOtfSo/XbtcgbqafBm17/k/qJ
	szSWipwbUErFETIoAWxSHkd8UcYxu3sJ6l5fc1mnzEdAxpUInUAwDud/ZqCPyOAdl2b2DQCsneT
	GwTEHnS4IQzbOaU4MenFptwwJNLoBh5qFKBChoy2Z3WGIGom4bWvwCw6xB+/Oe86J7unEhAxx38
	QUlvzHCViHjV6QkY4MzVX0rKrinV/k49A4wMzByKa0Ic+ZOTms8YHSJaiZqR8AgvYZn3Act2mHk
	zkCWpGxxWdqaRaMtTHKEtVc1++Apu+P+SX2PWzIDa5BjbXhaiQdMaALLhdrfkgByb+ZZsi6hpEy
	ZQvhZS70uVuPhw7ujjiODYD5cYKR/DzZ4ydftNiS6TVs+4Wixb6UkqIjxH9pikW5I5lKR41gxyv
	0vwbaYYcS2tmgPgvX2HA07JatmZItvewooehSDMJ3bbN3eFQgpx7vEJUBozV+U5waVaj5jiR0eB
	6Vpe+wHtehJ
X-Received: by 2002:a17:902:f78d:b0:2b0:606b:6fd3 with SMTP id d9443c01a7336-2ba78b30a89mr238596305ad.5.1778469365759;
        Sun, 10 May 2026 20:16:05 -0700 (PDT)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2baf1d26944sm81585935ad.10.2026.05.10.20.16.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 May 2026 20:16:05 -0700 (PDT)
From: Joey Lu <a0987203069@gmail.com>
To: mturquette@baylibre.com,
	sboyd@kernel.org
Cc: ychuang3@nuvoton.com,
	schung@nuvoton.com,
	yclu4@nuvoton.com,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Joey Lu <a0987203069@gmail.com>
Subject: [PATCH 0/1] clk: nuvoton: ma35d1: fix PLL frequency calculation
Date: Mon, 11 May 2026 11:15:58 +0800
Message-ID: <20260511031600.31929-1-a0987203069@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix four bugs in the MA35D1 PLL clock driver that cause incorrect
frequency values returned from recalc_rate() and determine_rate().

-- 
2.49.0
