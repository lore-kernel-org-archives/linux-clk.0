Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 045C733508E
	for <linux-clk@vger.kernel.org>; Sun, 31 May 2026 09:27:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780219676; cv=none; b=r/jgwZ9+J9GNIpYFw7qujbzsGLxPyIzs3o2CSONxloZeMFqsclAjBEenc629h4iQ+OXeaEXRUS8dNVdsvS16/RMDycf+goi4aiXycde6gVEyB5MNcvdBAszMqV0oWBo66nxmpZHlgdf6cFlGKKwygnQm1SM8/p/ADHwK3BifpII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780219676; c=relaxed/simple;
	bh=BNG/Nt3+CmK9Hyh4BW3hQ4JifMYdLAzHQ5ZifotMSIw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=of8CkeaT9jDboLHDnqLkOuNHQ+xigWLNhqtCfAaBPRDuQH9i/SW9DDeALLTWCuD53NDM4PX5shlX8bpmYnkTuIWgXuqKxDIAeefqPX3WIJ5FRU6iqQDaFpgwMiJR/cQPVSRM0gJK75X3+ws0jGYjnjyivcq9ZLalVo6idsOyfRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kXmkAQSy; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kXmkAQSy"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-45ef5146b56so1032710f8f.0
        for <linux-clk@vger.kernel.org>; Sun, 31 May 2026 02:27:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780219673; x=1780824473; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tIxTISlKz5zUY/5EeJFoGXkyj7v9D4tIsE5w4iprCUU=;
        b=kXmkAQSyWX5LouCuyJ+zfXZbCZPYC88HbyYchCtYp14qq+eeiXmfmQcINOCKKP+k8j
         T7rZu08lvEg4T5veFOKGVhTHHevJ3DXUidc345/0qYJiIUuUlapLFzjDnd+18RNmNB0T
         RC+mNiRmWLI6IJnnO691KOsQUzTy1OvkDktfjuSf/06XIwFOkqx/3dYRzFSWmTEhCaUY
         dPkzWSOAB9V22QGgURpFJPDwoh/2vvbSbe9WSVQ6RTYDtDerWTofgI0sbrVFbzYHHTJI
         lbU+h8/PCz2J3KBql0TT3heIwWHMnKV2LqD07uiKmOFuSIWEMD/+gkSX/DMgQ7GaL0Mk
         WfSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780219673; x=1780824473;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tIxTISlKz5zUY/5EeJFoGXkyj7v9D4tIsE5w4iprCUU=;
        b=sNJWipjJvd5qGnhy5Y80Sx0I+Fw1fdBilOaGZTAaI/MtemBdOqs0eoUYQhbEsVuDR0
         rp2ZbXu9t8JLtBE0gmoaHkXc1tbAWU7i3jXL2w2GJ5B4BqCPgtkCVRIyV6xqjzPU+Pt5
         AvPTUTBaWAx4S8RLMWJuelM5ArEYNFtcBfJTsMdLl8qk4u6/B9pjMw9VSZwPf0rri0bx
         txWALxk8GTGNS+mMiVcwXAoClJspcdFT1tP7lf1eLr++kYMzjgAtEt3hATBp29pGQf8N
         xqFkoSQZMvnMQUqCyXIntgtgB+B1SJBomYCC0TeOsCoDDODa/ipZWA0Rf66F1PmWoDCK
         Qj5A==
X-Gm-Message-State: AOJu0YybFYu3BoPVA5fxzG7Zr1ebk/47/FMinEYFuLsr4JSwhUax1h2b
	kAELbWHJ0aFIQvOXu3WsmYz9MFG0QUiyTngleue07zOUN0ZWyixwMqch
X-Gm-Gg: Acq92OFDdWGWyRR2oOWukNZT7I1bqYllnjM5mCz5Tx8xqtXFcx1YfDjw3Kjkgto4HH8
	jDm+mP5PGoSpXMx9SOocR1eHCU1zqgyb1u8T3X2LWK1PtLid0/xhslSjXHyopnYjh6UJ0SGvRYk
	l0uT1q6szr8zZW3soZ8vbNlYC4K7gnlM4Cw+wyMKW608w9And6XGWxn5TkmHth210F/HBYdbfnb
	dqxksdxvHxMhHCT1aAnH9BXVg/veyIEfM8I8SmfCFdV/zIN+StK7pzBDb8XosB5kLmqwurVBXE1
	+gUBhuFIV9JvyySHMKQ8iupqnmZOcHyZFh+TynPcC83UknzbXQ0hru8lM9j/9Qp7CCu0lqbTB5W
	NOkwp9qq3aVgTMgegs6v5Yqy8jnmIsuBxZ/R+HROongVE0vKFXTqwodRep576z9vicH/bbSpJXO
	Ier1zrytIGyaY1Hd05cr52ZxyVCi1JUkW68w==
X-Received: by 2002:a05:600c:64c8:b0:489:1abb:5559 with SMTP id 5b1f17b1804b1-490a2a1f07cmr88176025e9.5.1780219673463;
        Sun, 31 May 2026 02:27:53 -0700 (PDT)
Received: from xeon ([188.163.112.61])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4909d6a0e42sm163976435e9.8.2026.05.31.02.27.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 May 2026 02:27:52 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Prashant Gaikwad <pgaikwad@nvidia.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-clk@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/1 RESEND] clk: tegra: support 48MHz clock for pll_p_out1
Date: Sun, 31 May 2026 12:27:44 +0300
Message-ID: <20260531092745.12738-1-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

UEFI on Surface2 sets pll_p_out1 to 48MHz which is not supported
by kernel and causes BUG() early on. Fix this by adding 48MHz
clock support for pll_p_out1 along with 48MHz support for pll_a,
main pll_p_out1 descendant.

---
Changes in v2:
- aligned with downstream 3.4 kernel for tegra114 logic
---

Dmitry Osipenko (1):
  clk: tegra: support 48MHz clock for pll_p_out1

 drivers/clk/tegra/clk-pll.c | 1 +
 1 file changed, 1 insertion(+)

-- 
2.51.0

