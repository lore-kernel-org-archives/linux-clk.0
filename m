Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C44D235077
	for <linux-clk@vger.kernel.org>; Wed, 30 Apr 2025 09:58:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746007102; cv=none; b=kNjMAB0jTICaR35mm2cWkCXAKIJchdUWvf1kadbk1BgrAjm65Mi2rGtbYETlQ3fUqWZt+wuB+HjiDPy7KRzVw4J8pJy88d7uljkNZX30blkQuG2PqLXP3c6jpVOQW5WlT/ZvVDhY/ECTI07w3YYGHKQL9Yj8p44zyiRwttFskTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746007102; c=relaxed/simple;
	bh=wt/GV/pkMshoGMesRh4lIDdv+m3EQsqd7dNpcnh8PJI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=L38esxKxzXhlJmzK59v3EXu6wj51OtlTTHRJwIQIzLOp//5+9Td1BGyM2QhOm4xhgjgFw7CJiEDABc/pXGzQW/Yyq+QUOuhV8PqpP9MdqZL+u0kjQzPaH/lywjhsNx7vmtyx5bKAhKmSwdotwtbV6rafs+RPXfoqKlrH0SCo2ig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=fR6wq6w8; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="fR6wq6w8"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-43cfe574976so48750905e9.1
        for <linux-clk@vger.kernel.org>; Wed, 30 Apr 2025 02:58:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1746007097; x=1746611897; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=apjtAXv1I9txt3cw1nyZnrBi1ckaoQGJXeXPuGRHPKg=;
        b=fR6wq6w8BVGCcO0EdlnAYfZ0iedcS+BeCbR7Rj9j8vRL1sOSIqUK+jjZVmSQvge8uz
         enk8bB9qM+jihJM87VIVCOyX/M4EmqH8Z83/PHFvICmk18erBy/vbTS1uUryoHtTb9pa
         xHsoObjT7uMTA940rh6DXtsZvKiftuXO707vB8Ek92rkStbE0xF2ViT6ao1TuGWYxsPM
         A6NxREiGJFjKBRynC1rZVphdu6q+AD4X7T2F+54e9ouzjam4oMElI6FYcZWBwIOADStZ
         jAi05H6ZjQtcHD7ENH0++C+0jkpFJ9i0eZtsv0bhXrb6qKAXqqfHuzM/wYFMlAT/J3cR
         UvTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746007097; x=1746611897;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=apjtAXv1I9txt3cw1nyZnrBi1ckaoQGJXeXPuGRHPKg=;
        b=Eq+oac64bGfe8Qazmz4RvrL+AqfaagLzDhTgQlq16eBn8Lk/R/vrRSIg9xH4R4qRYs
         gvaZx7+D+5z6lGgo8SMDlaw3BclKwc18mK7nrnUZqzWDYhCFiKPFCn7vwiB9LBHoIUTw
         ZCa8Ifm/wqzpBqzAgE9kjX5nYm5dL132x4yBZCmeqEX+pDqcNWVfNsONHX0R5Htu8Lyk
         LOG7cTgPv4ZTpH1NreZHaYikPC6ec1GNNh+IhfV5ApCxEEAF4lGnCCXQD1801O1xme+x
         znRXppvUHOwJgiFWhvUYLwjpKSCilHz8iJqwhQa8UdnNNi1lyrIHEQSkhCdDxDLm/277
         Brew==
X-Gm-Message-State: AOJu0YzDNqSPdnDhItZ00xFE31nBNF9KWYAgOETB6J0joqwbys+IglY+
	J1lcZ5ynIRkd95vMa114e7f8Cu1JCpQpkVk7lvpzlLExYyP6/5USyzrkmy5UjWE=
X-Gm-Gg: ASbGncscLlKm8qA9exenJ/0q14s3GKziTzp9tDZmCbDmLZffzhtnX6wPvbWUmCMbBv2
	74h2pi6cWOGGi7TN283tGqFVFRzNafeZMP4hczUWzsPDCtzt0YKXdt5qTIbYpY0ufCFly7yOHFb
	QDua0ZWu8pdKoKr7mkJOZHBe5FRhzI94Amx/Gk/w0Pwlm08TP3FQvtmb6AF8kouJr8wYllcEHZo
	GkPA9z2cpOBWXHAldmCYL0WeJyslcv0whNJHdTZyZff1J0785APMEji0r15xzSEQCE/B+mmPvhz
	O/zCuOcjeIykW6Jwj/sEea3rCu4CzOjJaRwrlMjYm3FYbnJbNLVkLVPQQ+4MFahGwu/RyrIe3Tp
	y2SDahU8=
X-Google-Smtp-Source: AGHT+IHEnOmqmdJrRnX+Y1dbSuEsMHj4BAIYWaNReheY6FIqNiBIqaY9WubjTu+R8ppDVfweFMjDZw==
X-Received: by 2002:a05:600c:a20c:b0:43d:7413:cb3e with SMTP id 5b1f17b1804b1-441b23fa297mr11181125e9.1.1746007097418;
        Wed, 30 Apr 2025 02:58:17 -0700 (PDT)
Received: from localhost (p200300f65f00780800000000000001b9.dip0.t-ipconnect.de. [2003:f6:5f00:7808::1b9])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-441b2af2a5fsm19634895e9.20.2025.04.30.02.58.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 02:58:16 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org,
	linux-pwm@vger.kernel.org
Subject: [PATCH 1/4] clk: pwm: Let .get_duty_cycle() return the real duty cycle
Date: Wed, 30 Apr 2025 11:57:46 +0200
Message-ID:  <3db08ded39c09aaa5004b3b8b1238111f199e819.1746006578.git.ukleinek@baylibre.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <cover.1746006578.git.ukleinek@baylibre.com>
References: <cover.1746006578.git.ukleinek@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=955; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=wt/GV/pkMshoGMesRh4lIDdv+m3EQsqd7dNpcnh8PJI=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBoEfQdZgGoFqqvkMOrD/AkoZmzebKJfWAyQNVQS Owmdtzwa3KJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCaBH0HQAKCRCPgPtYfRL+ TrdiCACbYka2dIv8fv5ozvZGUA/EdQul32+i6NiiabAaZ9oZmJao5RHNHk2RqP3SvRFu6u5CPhE Fwz+I9w0nANmO2oxT+Mw3no+GgTeEZ23A+uiwZGPmpjCOG1+HygL24iNR3r7lDcQsbsgGVVP7u9 3TVGqZCrSgxBB+8PzaYVwskSl8mxvPrsxQvRTwCMui1gd3xxzq1MYSvMxU7fFlwn8bJP54wwF+P OnrY235VRw8qXbaq7t/HPT0YSiW8e4kVadoByDWkB1iVGX3pUm+HMTmFkyWlLsrMB4AWpvvTx2k LlTV5PaFagBYBhpYxfGMmSipaWbCUK6PaBP33qkL2lCQCKzc
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

pwm_get_state() returns the last requested pwm_state which might differ
from what the lowlevel PWM driver actually implemented. For the purpose
of .get_duty_cycle() the latter is the more interesting info, so use
that to determine the output parameter.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
---
 drivers/clk/clk-pwm.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/clk-pwm.c b/drivers/clk/clk-pwm.c
index bd4f21c22004..429150bba8cf 100644
--- a/drivers/clk/clk-pwm.c
+++ b/drivers/clk/clk-pwm.c
@@ -48,8 +48,11 @@ static int clk_pwm_get_duty_cycle(struct clk_hw *hw, struct clk_duty *duty)
 {
 	struct clk_pwm *clk_pwm = to_clk_pwm(hw);
 	struct pwm_state state;
+	int ret;
 
-	pwm_get_state(clk_pwm->pwm, &state);
+	ret = pwm_get_state_hw(clk_pwm->pwm, &state);
+	if (ret)
+		return ret;
 
 	duty->num = state.duty_cycle;
 	duty->den = state.period;
-- 
2.47.2

