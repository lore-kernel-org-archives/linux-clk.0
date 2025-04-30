Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8740221FBD
	for <linux-clk@vger.kernel.org>; Wed, 30 Apr 2025 09:58:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746007100; cv=none; b=KXdu2EwHJvP50qYspIXmn0/MMBle+pH3rtuZsp51MkAkdWQu8qS9OfU8EkLotSE6lT91ya6cpbZVYQ0KgCwlVZ8lFzADBhyWQZhFMAdjDFNCeQpF+gnoe+E+Y6TmhsIC+29FUo1loxI9GMmRV2B5QUTUHlaLUBTYOCZ01nFcEHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746007100; c=relaxed/simple;
	bh=Ux1lSv/ODoHafw8NN4kfW3nJGFslo2MuBF/+Iyljx2M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=u3yeDAc2IhG5ONQ0zz185oYuukBviG41rZj03TvO1v4afLr5wE2zF6rmzTcTcBiHMo1k8KI2Bc7f3sBW7cOZZGpYVz93z57Tz7JHjAv9QQKrt8ItoddAjGRLqwEca31/Y9m3mj7sg4CeW4ewMPBb2Bk2b4saJzzrzO3nuwUdGg0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=M/U96/Vp; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="M/U96/Vp"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-39c1efc457bso5187621f8f.2
        for <linux-clk@vger.kernel.org>; Wed, 30 Apr 2025 02:58:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1746007095; x=1746611895; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ojVPFPoj72cbDrEfzyh1SLYL+3XLD89PajzAoaTffVY=;
        b=M/U96/VpMsE9q/Tp8CfwFq648hCFV89J+VLVjX78hLJNDgDc6qtuWXDWcfPcAQ11nM
         rbESy59k19GlKliweQEpRbEdoxxpbJMgY50vGPtxEhbOeJtBn9g1ZAdSoEqcmvSlauT8
         iTAbwh5k/j1EjeS8H22HRfkuzl2qUMwW7/hFe6g8UgyJeB44BNa5XJQjuBGk5MYKla3g
         Xt9/3Qkiu8vFlO0eeoxrctChhG+8IBNUPcZbxR5dMz07XVNYvriCA+dyQ3W33JOipdAQ
         6P5Wwp1v91uem7yd0K6SLhNynWZ8sN+rb/H5WOfKhhctDwV+1BeUNVCnzu0VligumkvU
         74iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746007095; x=1746611895;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ojVPFPoj72cbDrEfzyh1SLYL+3XLD89PajzAoaTffVY=;
        b=qOz0DKqYFuRYkDzw9cvXmrWZSBQRXMR0zu6VZTbMXTeYjtRkJfXblsEaSpZ0iJUwT3
         CgEsKZ50e5Dp7C+lkCWhsRyIN6xGSmuQ33wFs8IzLkK7sZ4yP+4x1J6VwrEWebrZm1pK
         nDbVCg7/gwsw3sEl4AaO1k/vFa1bfM0BAbZehm+Ya0w1vaHrCxo8JigviSOitaZV7VEB
         0MdCMelY75sWW64LXJt6UV59SyR0Bec3CCQCIe4XN4jL52Q76BE72UfZRG0fpWsreA+7
         ChZC1fPy7tBONqE4sh2+xR+Zfesfs8DnO2IJKPC/iQyJAFw2Qj6UAxh3L6Upd7v4JzVa
         /iqg==
X-Gm-Message-State: AOJu0YyOvh4p9MKqoqltgak4RJ+pb/8ff9Aw7kZc0Ci1+ImRxk4NOPhP
	ZDH3pN+BK6OhAthjPOXXOP/j6nqkXMgiqYzoJh/JGzXPPO6l3C32TXfU+rQRiC0=
X-Gm-Gg: ASbGnctLHOi5Dd76k76wPqF2Tw+M4neACPY+pqEW0DAN49cC+onSfl3ga8Pc2epMwEv
	ERzgvdrsJ4KmPb7k2g7r092RQ6ALn5wj9rzTxfrE8Ua0mWq9GPyipkXxc2xuSHjsbfXUA/iZbpX
	AGP5k23PyX49mhCTvzIxTJ2fqc1WCnsa40BL4JhLgPcAunUUAaXwo8yPBIdip8tLDI77Ck7VOe+
	6Gj2YOqMryfMUe5cU4buBXId00h8mtkh7Ijbd11SZm6epsExouqcDnrxmajESTMfPxSOvYPMfDt
	lJJDlPnGp86mjQ7izYRa2q66iof7j00aXUFsM7q6kHsY6430J2hEHfxPivW6FZH7pBXUGtwdIJd
	ix1r+zrA=
X-Google-Smtp-Source: AGHT+IGuK4ubxajjdMneL07piaB1dzdp7uaqBR3+WB6iRtOElTvsGegjGX3KJyxnCXSFeCq6+g1zZQ==
X-Received: by 2002:a05:6000:3109:b0:3a0:82e7:227a with SMTP id ffacd0b85a97d-3a08ff34d04mr1592154f8f.6.1746007095050;
        Wed, 30 Apr 2025 02:58:15 -0700 (PDT)
Received: from localhost (p200300f65f00780800000000000001b9.dip0.t-ipconnect.de. [2003:f6:5f00:7808::1b9])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a073ca4cbcsm16280871f8f.25.2025.04.30.02.58.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 02:58:14 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org,
	linux-pwm@vger.kernel.org
Subject: [PATCH 0/4] clk: pwm: A few improvements
Date: Wed, 30 Apr 2025 11:57:45 +0200
Message-ID: <cover.1746006578.git.ukleinek@baylibre.com>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=690; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=Ux1lSv/ODoHafw8NN4kfW3nJGFslo2MuBF/+Iyljx2M=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBoEfQa0Nbntd8NTipaTkM6DAnir5IUAf0Z9kn/9 M3h7PRdb6CJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCaBH0GgAKCRCPgPtYfRL+ TuE3B/9GVnay9UfLoo3ODdXCDg5PXDMoBdE4nEeIqGywmw9aOqSdDF/c/8mWH+C23uN1MuiPAuj CVUpTkiurUu8Xxr/GF6mF2YkW0ujNSIuNfYnLa/YWw0kL57/9r4K8zwwMcf3ZKQCdhX2Lo7Am4Q RFLrXT4igb8u9pjg8WdvnTAkL7hy6cZD73x/U/NQ86m2dpqcYlWMXtKk0Jm8VfKfnE18kjkYPta 0dxGbybDV5r0DukXpC6pXvdsD655PBokt9g6byEzdL8dZ+fFRhcEx/kj1St5GtJVF2swhCx0BZQ a1DDiojcfum+svv/ckzlt6J2lVoo38MsH8nHaiuPta2hMCCP
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

Hello,

my main objective here to get rid of the call to pwm_config() as I want
to drop that function. While implementing that I found a few changes
left and right of it that I think improve the driver.

Only compile tested.

Best regards
Uwe

Uwe Kleine-König (4):
  clk: pwm: Let .get_duty_cycle() return the real duty cycle
  clk: pwm: Convert to use pwm_apply_might_sleep()
  clk: pwm: Don't reconfigure running PWM at probe time
  clk: pwm: Make use of non-sleeping PWMs

 drivers/clk/clk-pwm.c | 49 +++++++++++++++++++++++++++++++++----------
 1 file changed, 38 insertions(+), 11 deletions(-)

base-commit: 8ffd015db85fea3e15a77027fda6c02ced4d2444
-- 
2.47.2
