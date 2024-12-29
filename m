Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C20BA53AC
	for <linux-clk@vger.kernel.org>; Sun, 29 Dec 2024 07:47:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735458468; cv=none; b=NQQx770M0nYplIGxrpapRpAsAeBcymDGNI1TV9NPx02koMDM2jRSVf84JY+TlAI+IBlNwlUb/huLgjTSI3TwXXbot3Iqn4oaN+UNMR49dVR2PExPYBs9yD6Q3iOKxYb4vQfmjIoIPMqf8+w/eFzSRHJPdlk98YqlDbKOkFf15+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735458468; c=relaxed/simple;
	bh=x4+nb9/PGNUsK/89p1ygaH+gSdVhGarf3xtoVnn866Q=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=DqLANR6vLpX7CZJ2rhACy3cW+iSkd081XItAD9kYgzj0floBlqx5riAKOdLfGwvQL+D2zjJQDgXdCtwOS+vQ+LGZhEC1tJuJIna5qC4a90QeIaajReqnTn7IdNT24ksELlS77NDMShjRXOyRudDG0UluzwMMJk+KLF6p0CfXaD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tenstorrent.com; spf=pass smtp.mailfrom=tenstorrent.com; dkim=pass (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.b=LsIAX5Xf; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tenstorrent.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tenstorrent.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.b="LsIAX5Xf"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2163bd70069so3099795ad.0
        for <linux-clk@vger.kernel.org>; Sat, 28 Dec 2024 23:47:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1735458466; x=1736063266; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HCZFWXIAcGGHQ2KfGyCUAdwCjbNuy+/7pP/Yd0hTD5A=;
        b=LsIAX5XfVwM/jSJTFGPBCQw0lkFV/h7Hwbfj6bswcF+1TKF9G+iiFvmjJuTj2N8aBz
         nEA7Mh3XsAdhy9TT64UDt6cT+8DEzgWkEsSb1UqwQJM0jJ4IIXwm59nY6iD1UvAXFAQC
         blPwJ15y+HRliu3tC0HVdRyJFBdmDZsATgfjv4eCIJX8yYxfhCucX7PpfvaAUzgmBuIe
         j2BKkRP9V5tA2+P6/EYrR90rAC6cLmEIUYNY6DygSQZ0/LX+qYtCeuP9VW2hpMYtcYJU
         ZmaneG89/1w2S0dRiY0RXr6jACdT7yWA/xjDNVGkXtoEj6B5Y5weeq+XHG+SeQZ1QztM
         iOyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735458466; x=1736063266;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HCZFWXIAcGGHQ2KfGyCUAdwCjbNuy+/7pP/Yd0hTD5A=;
        b=vuWkZOWijom0dKlMwlyP99dZCnBx9FQGPkkuqbwZLwgbd5TZ7YDSt3g3LGxYTbodze
         EKjj7Bh7TDUvz0ve8Pw/wrDhWZ0uW30kG9f1muXp2xY8k99jWmnRAYhBrls3nuUkiUjk
         N6NU/VzFB/6twV6o2j//fhVuKc6mUwv025Elz9tM7Id6VuW7iahKjzmBO5WZQeGwEdts
         akgy3AkyTOphrqnic5o6wiJ8uJ/q/0+CHmYJuCUW3mU9WYtKOx5FO/2Vx+XWzu+iHuay
         fJx5kfI23T7fHyaZj0lDKPQxp2wLwWa4YTKUG4ZVctlagYJaW6ZSoXVAAmkTlDD/ZNwG
         tKpw==
X-Forwarded-Encrypted: i=1; AJvYcCUC1BM6C5/gn1+A23wLxM1yU/hP3ulGlShVYHlAgLyD2tskfLmh6zs5Ih5Jr51lYqpVZnYfsws0Pqc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwV309TH/+rJAQDiPRVR/Bd61U7DLtzdvA3mRz8Z6/0/HIQFJLQ
	2h0xobrzNL2OSZYIt9UeTjKhFL+EYhdIK617A6SjkLyNO9teyZtfmFZ9+tppMF0=
X-Gm-Gg: ASbGncuJAdAD6ir9MqFayUr0mw9D8zuRb6vIutnvSYt9dKrwSn17/vrWHOjjQPL46b1
	Jg4y+HNXsFc434EKIgKmSpIg3yPXj1B9kfudLBUbucZVejQbcgYZIqTeaJ9fVY1xRVM4pTbWFte
	teVY1bmB1ONibUtHSnon/fFiEfVcRs3ykxoHmBSCr0gLilqqIHBqHu4NOOqJJLky8UFw99K/ntS
	dmm3X708xj2GMJWbytx7Lj6LTW1pVUpgC6awZ2KfOG7Nd0ZLH6YLeQ5fmXo0D5yGAyBzZn2qqP+
	6NhjdFwucyziSk8E
X-Google-Smtp-Source: AGHT+IHZCj/ACqW2WfzN/wft9ZZi8fRsQZhVpP6fToFg+f4nX2yo6cXGFsTfeAx837weIf2C820g7A==
X-Received: by 2002:a05:6a00:44ce:b0:725:e444:2505 with SMTP id d2e1a72fcca58-72abdd4f4admr46957360b3a.4.1735458466063;
        Sat, 28 Dec 2024 23:47:46 -0800 (PST)
Received: from [127.0.1.1] (75-164-218-15.ptld.qwest.net. [75.164.218.15])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72afb196c04sm7907658b3a.150.2024.12.28.23.47.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Dec 2024 23:47:45 -0800 (PST)
From: Drew Fustini <dfustini@tenstorrent.com>
Subject: [PATCH 0/2] clk: thead: Fix TH1520 boot dependency on
 clk_ignore_unused
Date: Sat, 28 Dec 2024 23:47:41 -0800
Message-Id: <20241228-th1520-clk_ignore_unused-v1-0-c8f6333d1784@tenstorrent.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJ3+cGcC/x3MQQqDMBBG4avIrA0kk4qlVykS1Pzq0BJLoiIE7
 27o8lu8lykhChK9qkwRhyRZQ4GpKxqXPsxQ4ouJNT8Mc6u2xTSs1fj9OJnDGuH2sCd4ZXlgrxk
 e9kkl/0VMcv7X7+66biIdBChqAAAA
To: Drew Fustini <drew@pdp7.com>, Guo Ren <guoren@kernel.org>, 
 Fu Wei <wefu@redhat.com>, Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Jisheng Zhang <jszhang@kernel.org>, 
 Yangtao Li <frank.li@vivo.com>
Cc: linux-riscv@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Drew Fustini <dfustini@tenstorrent.com>
X-Mailer: b4 0.14.1

Add the CLK_IGNORE_UNUSED flag to apb_pclk, cpu2peri_x2h_clk,
perisys_apb2_hclk and perisys_apb3_hclk. Without this flag, the boot
hangs after "clk: Disabling unused clocks" unless clk_ignore_unused
is in the kernel cmdline.

In order to allow individual clk gates to specify their own flags,
the call to devm_clk_hw_register_gate_parent_data() is changeed to
actually pass the clk flags instead of just 0.

This series is based on linux-next.

Signed-off-by: Drew Fustini <dfustini@tenstorrent.com>
---
Drew Fustini (2):
      clk: thead: Fix clk gate registration to pass flags
      clk: thead: Add CLK_IGNORE_UNUSED to fix TH1520 boot

 drivers/clk/thead/clk-th1520-ap.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)
---
base-commit: 8155b4ef3466f0e289e8fcc9e6e62f3f4dceeac2
change-id: 20241227-th1520-clk_ignore_unused-32b2d02ede38

Best regards,
-- 
Drew Fustini <dfustini@tenstorrent.com>

