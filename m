Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.125.188.123
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795466924;
	b=u8di5Lfsnvo7d+Mhf0P6EXiqROr1Yjn8d7dFDY3MXldhjjt9B2js6TeMegjnSxvi7qVC
	 J5QVeY2sE9d0je4Ve/nNSid+4t13yZWSMFaQlyCfU+bccFmYWESEmq9oyNXtQOLGS5CI1
	 qVkwNqe7PnTTROZ4Ib4d79RzoWQby6tVw1ZRyg4keVWaGSQ12hm3mPnyqHZxH/fp0pxEx
	 O+rXPxO3RHQfBSFPOf3JSNQBDTzzOJBkYu3v1NpcW61NGSnpc6aCCvVNSto8PkJ8w2gvX
	 qjk02l6c0e6oPfOlPDdq7bT71xJ6HdtRl4wBQ/J3zoPVSC84JqBGA3cladR2RKeNxhw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795466924;
	h=DMARC-Filter:Received:DKIM-Signature:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=x5ghMqZTOOiioeCpMjP1/MdXHwlwiqoLln7wLLITyxI=;
	b=H950vjL3BfQSwwc0PRgxiR2dHp1iBJUtbZV2+8FvfthO0q64bOLJ/Tro4jXfVvjoXjwa
	 FIFaEGpkDBxagyCcvBdm+EgY0NL0vOq6s+5+6hG21tVq5UFA4Z/YYf7NmgG3ZiQ7FaJyR
	 YgcZ95NYWB7aN3GvfmOIyVCk7LGI+R6inOkW49dRgEoXNJUYUZqXQ3CxmFn1oM2ifWIJR
	 IRUpEVYG0qMzgRuV6MvjcBrG8ZQ/rosDdb0JPkvnJgSYUpBTfRYGuE0GaenU2OXGNKxAP
	 KO5pLgkwCM10wnfoOx+Gd5Z34Xm3YnmySzubKO2lJZbrU9PZhFVWf+R7EcBKw305uqA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=canonical.com;
	spf=pass smtp.mailfrom=canonical.com;
	dkim=pass header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20251003 header.b=KtkCGgvP;
	arc=none smtp.remote-ip=185.125.188.123
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B69B606A31E
	for <linux-clk@vger.kernel.org>; Mon, 23 Nov 2026 20:48:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8B69B606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20251003 header.b=KtkCGgvP
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com [209.85.128.70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 9ECF93F2DA
	for <linux-clk@vger.kernel.org>; Mon, 23 Nov 2026 20:48:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1795466921;
	bh=x5ghMqZTOOiioeCpMjP1/MdXHwlwiqoLln7wLLITyxI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc;
	b=KtkCGgvP8v6eC8KoD9sJf6Hrem89jSXeLuXqevgORWc345ztX39bLlbMACe62613Z
	 xzxju1uhOdOP6wqW+fhdqIGqclj7ZEeghl8FG/JpARy2QTWzNSSqGOjDHuVY+aNOtV
	 lf6Vgfb9dBEB2L2eN6QEHSdZQhwvHcChR2CCSGJsAwF6Vxl2n3a/ASmkD9nDxYN5Y1
	 3+yLSO3TEPiU50t2peJMN93jPlv0AiT5QmFGKwzXzJfhZzveQpYkEo+Qo1J1uNOtp0
	 dJRDsNlhDtCqE551aJL9wV8OajBiY+QRzFLwXgGZ5hS/7byGcGk71vA6zJXQYij1nh
	 80tjCXCKCObhwBfWdwh0GE8/Updtih662p46kqpo63THr2qZ6QL1ah3c3rDgJc0CcT
	 Vy1RzrRc53EdHB1SbfZz+LrpkcGKEqvkg9VAh60r/uKX3MsUqZtpJipO8ZiaZW7ARl
	 c30xequW0SFf1yGAWn7UxHEhBShVCEbl0hiJT5sRYcYYzwpZXt6CJ9iO1pvEBOZNzn
	 L+SHLr3aDbgciDICG2lCJMwYaEq5p/46XIYOw9BmBEWlnF3LUwDwzeU1kYvT7mRXmw
	 3uKOEqaLr49cO9TrMi4aJ4vAfaD/RPf3a858S6DqNgn3XogEdXH4bK4oGQ7JMTHdO5
	 gvammTPfFzLDfhMqFE177q3Y=
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-4bb6bac1e84so23936395e9.0
        for <linux-clk@vger.kernel.org>; Mon, 23 Nov 2026 12:48:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795466921; x=1796071721;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=x5ghMqZTOOiioeCpMjP1/MdXHwlwiqoLln7wLLITyxI=;
        b=24ezC+eDrTSolhajx2brrOXhp5ybRk7eF3yzNcEbNmd/Avg4cNpAco6ZQKqOTSgzLR
         0BFa8Qh/7lOY5wNYxvlIM/zAgt0J6jttmlznrqepMfWNqXUpGt2Ny+h71NOdapBPZVqO
         2Vrn0XkrxgdVZ11oLQ6fcubyLRSOuw7s0EX6I1/EpALAyUNQEE4GWucFbwsMyJI9m7UA
         uZiKYySTS7R1+DThOz364bgYznKaQ52+HB28iAIAMSjda6QN72Cjmd/GKnVQ9VKVH/9Y
         nREWLhsZGrTJVG0nR8wB3ro1P9Mr+JIeh8bdoYAlr29XIHhn7S6vqZrqZi+LeiWqk3+Y
         P/WQ==
X-Forwarded-Encrypted: i=1; AL+hErGzzpmJMNf9lcUOLUHBDsiCpCcJfu0Xd14iBq9qgvqgqgzXRdY06Gx7kVd1Dc70rvbWRc6DRecnpao=@vger.kernel.org
X-Gm-Message-State: APuU4Z8/XKZgxe6Njtsy8/UwDNF+osO522Bv2QoF04iNUycds2ecmgGV
	THWIn1ku/t94QpYeb9/EVi9RHlqh1QUzxKWf7iHlVGo6V4xk1w02xyl5uH+nS2yPQKwB4D+4lZo
	7nsf7y3ieb1YvtOf3wqQek9WLl0bbNNLFFLA+IF1gujTYx3Wi+QBMlabgPCrwVvaSMpZtgse5Qf
	nePBCBdJQF/lzzRv8=
X-Gm-Gg: AZFdTZc2vWPOB+8X6yNX9VqwDWIpNJYpw3DbSV+Di5hwWSVYYwXYQzHT2HKB6pLDbiE
	t6Nprrd8c8+RaGrOYyH0XuCtTzlZraYy7TezwtkLgezz/T/O0xmO/ecDKiN20ikNg/gdS3FgIbQ
	8ntHviczxuBkD4jf6GLKG7JR2D6gdQ7WCfV4sFcXr7Akv64ksbpWE9RLOQ0QhT8JWEcvMQHnfbs
	HcildFaZRIHSOSo1ifkZ8TrMegnG1YT9xWbDAvJaSDlRZq7f/moZVJ0S5Lt5//rnUbDV8bbWvZX
	IIc5yMTGRWL5tUPK57sgjZmoHt7lekD7bhlUnMx9TZmPSrVT5uZrItfVwRXI3exkrB6jwdqqHZj
	rK8cnmJfDUi+DA/VcA6OQ1Bfz78f2+WVCt90qS2XtF19Gyc+cluC6sbJgGVc9SE8aI5ohQShZM0
	1uUJdXAenGU38vSJQFSXQkz92nn6I=
X-Received: by 2002:a05:600c:6218:b0:4a0:1b14:e283 with SMTP id 5b1f17b1804b1-4bb887c341dmr281648915e9.1.1795466921273;
        Mon, 23 Nov 2026 12:48:41 -0800 (PST)
X-Received: by 2002:a05:600c:6218:b0:4a0:1b14:e283 with SMTP id 5b1f17b1804b1-4bb887c341dmr281648705e9.1.1795466921012;
        Mon, 23 Nov 2026 12:48:41 -0800 (PST)
Received: from [127.0.0.1] (ppp-93-104-174-36.dynamic.mnet-online.de. [93.104.174.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884ab091sm540134265e9.11.2026.11.23.12.48.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 12:48:40 -0800 (PST)
From: Tobias Heider <tobias.heider@canonical.com>
Date: Mon, 23 Nov 2026 21:48:29 +0100
Subject: [PATCH] clk: qcom: glymur-dispcc: Stop mdss_mdp and mdss_ahb
 clk_src from getting parked
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261123-glymur-dispcc-park-v1-1-d636ef8e04f6@canonical.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzNDQyNj3fScytzSIt2UzOKC5GTdgsSibF1T4yRzMxOj5BQzIzMloMaCotS
 0zAqwodGxtbUAg7jpo2QAAAA=
X-Change-ID: 20261123-glymur-dispcc-park-53b7642cd626
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>
Cc: Hans de Goede <johannes.goede@oss.qualcomm.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 Tobias Heider <tobias.heider@canonical.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2123;
 i=tobias.heider@canonical.com; h=from:subject:message-id;
 bh=xnIq7SFYHmKw/VHi208Ii5oLDBvNGsgiV58IDhnk/Tk=;
 b=owEBbQKS/ZANAwAKARNJjwMsz+naAcsmYgBrBKan+lkxyhGb/2S8YU7Ft793UHYnPyw/i3qFj
 xgfkmqzl5mJAjMEAAEKAB0WIQSbaT10QIAuim/4A94TSY8DLM/p2gUCawSmpwAKCRATSY8DLM/p
 2l5uEADJdpop5EtkZCehx8BbnZ0uQirbAwD4uaYeKv9e3Nno8sgcFaNx4XYoS/ZYyGquVVoN+OP
 WzKiz+nng2s53tafhNyVPXz9KT6GezI8q+Sxlb2fRYzEUJxksOR9jy8xqAHKl3w55FUTEbwDti2
 zWVRQg4m9nojYMZP7yj1+s6osbVgTRPkRjRwAZhmGUuO1LCR4pjuoal+eeSv/DWWMH6toNEYqmb
 ai2f0B2rmV4S/XLDrDZoKNSkTjZwhFmtlIpQC/Z166A/k6wQ1UjxorOCvS7/UYMqYBxb+Fez14F
 mx3HvJBScXZqs+qKu5nWLtY4mEFQY5ld5etyQGEU9JIZ+LlVbF/dvaVyfZ7XkyS5KTc1c9n8ABR
 sibOwukphKEQ0rpSvyTbRv1D5me3FMrh7jVGXfn6yT6p/1/HusZVXPuGclolrvaxRrOP/sZ8HPy
 BLTdokiOmjFdaidpPKQfL3EV6USTnChbAHCjfpk0abqpZLqfHaJ3gGKaO9G7+0KVokIw94erwHG
 e9e/p58PX3UmhDEhqJf50NCuuPY5wluJoc5wyaFEEMGxLPS8VsU5Rl/fmlDvsdC49yCWs9aOsLp
 Q//hh/NUOqEg4tyW+8dgezKl/Zmx7S4AOd6pOhrgDW7KQKue0YH/ZOg4m3vmvH8aVbT63hc8Yoe
 oaBX8FavqNaMiuw==
X-Developer-Key: i=tobias.heider@canonical.com; a=openpgp;
 fpr=9B693D7440802E8A6FF803DE13498F032CCFE9DA

Parking disp_cc_mdss_mdp_clk_src and disp_cc_mdss_ahb_clk_src at 19.2MHz
kills the EFI GOP framebuffer. The EFI GOP framebuffer should keep working
until the msm display driver loads, to help with boot debugging and to
ensure display output when the msm module is not in the initramfs.

Switch both disp_cc_mdss_mdp_clk_src and disp_cc_mdss_ahb_clk_src over
to clk_rcg2_shared_no_init_park_ops to keep the EFI framebuffer working
after binding the glymur-dispcc driver, following the
precedent of commit bc27dbefae6e ("clk: qcom: x1e80100-dispcc: Stop
disp_cc_mdss_mdp_clk_src from getting parked") and
commit 5285b0467578 ("clk: qcom: dispcc-sc8280xp: Don't park mdp_clk_src
at registration time")'

Unlike x1e80100, where mdss_ahb is never parked, glymur's ahb also
gets parked. Unparking disp_cc_mdss_mdp_clk_src alone was tested
on the HP EliteBook X G2q and is not sufficient: the EFI GOP still
dies unless disp_cc_mdss_ahb_clk_src is left un-parked as well.

Signed-off-by: Tobias Heider <tobias.heider@canonical.com>
---
 drivers/clk/qcom/dispcc-glymur.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/qcom/dispcc-glymur.c b/drivers/clk/qcom/dispcc-glymur.c
index 32cc5226b4de7..6eb4ca8b3e771 100644
--- a/drivers/clk/qcom/dispcc-glymur.c
+++ b/drivers/clk/qcom/dispcc-glymur.c
@@ -312,7 +312,7 @@ static struct clk_rcg2 disp_cc_mdss_ahb_clk_src = {
 		.parent_data = disp_cc_parent_data_6,
 		.num_parents = ARRAY_SIZE(disp_cc_parent_data_6),
 		.flags = CLK_SET_RATE_PARENT,
-		.ops = &clk_rcg2_shared_ops,
+		.ops = &clk_rcg2_shared_no_init_park_ops,
 	},
 };
 
@@ -623,7 +623,7 @@ static struct clk_rcg2 disp_cc_mdss_mdp_clk_src = {
 		.parent_data = disp_cc_parent_data_7,
 		.num_parents = ARRAY_SIZE(disp_cc_parent_data_7),
 		.flags = CLK_SET_RATE_PARENT,
-		.ops = &clk_rcg2_shared_ops,
+		.ops = &clk_rcg2_shared_no_init_park_ops,
 	},
 };
 

---
base-commit: 909ef7a9a30fa139e69e555e3606680f5cca7726
change-id: 20261123-glymur-dispcc-park-53b7642cd626

Best regards,
-- 
Tobias Heider <tobias.heider@canonical.com>

