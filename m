Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 700161F190A
	for <linux-clk@vger.kernel.org>; Tue,  7 Jan 2025 15:55:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736265340; cv=none; b=CIMrjZt+XZAem+7x7iy+T59m9GK3S8sDZX2oxD1Aa8rP4zcUtrbg2kgqiJljXoESjUCrcFAYks8xjjT4mKZSHgAB3RFC/BmyiMllEo8gSqjRuS8Zg++JCP2WB5hQUscLp1ShaKk1nPaRrXSYmqF10aA1VUzSq0lOOeqaVTK4ggE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736265340; c=relaxed/simple;
	bh=PjDOhgrKG6iaPq/ljTnv08K3Tt3+ljS/3Zo3ZnBspMM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=e40SRYXWqD70TbcNE3dNwEOuVxrQXec54B4GxbzGSAAjbbwpKB1QxgVHXbGNMlq2rkJsN3qIWaRhu5d/gu4+I+zV9HkMuidY2X2mw3lLS0ytbFYaR9qNgQSN4W8noo2Qh0HGXyUASaFN0/uBtsBkjFkK+vE0QDlldkPvvrYN5XM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Knxa0b8P; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Knxa0b8P"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-38637614567so7199176f8f.3
        for <linux-clk@vger.kernel.org>; Tue, 07 Jan 2025 07:55:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736265335; x=1736870135; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yNy7DNnFZXplDv0Zlm/11c4dslj5j2UjTcsCw2RR9TY=;
        b=Knxa0b8Pg3qTWJxOrPK6i+++yQv4m2B847M1xGKv1EreBeFIDdq94KPnEC7gVeaxCF
         J+Gd/P94etPzTB2e4NIODv/rYUgmWW9xbv5ZXrWdV+gJ1PvqewuZbIStSLHJCigsWJd2
         1ObzhH8yMnpMXjI0LzQFUwmVYz/GTSrzMCMryTHnvdTVOGeozVjkJI5W2Bw/bubk5xRN
         RYOw2O+OGsVnRLLGJ08+yZMT406kQI1qpFyIs8LKH0AFg7YqkTwtTnlmWUPscrAtx7po
         4ZxzsdIC2ioIYu/F122uWp0uB/RxCTomwYCibMs6RMikYSz/MOLAnuUMeXSwyt2Ehm39
         pCEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736265335; x=1736870135;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yNy7DNnFZXplDv0Zlm/11c4dslj5j2UjTcsCw2RR9TY=;
        b=WG8YfOW7UwA9Iw+VA8wGpElF8YmUDdW63BzoBU1lo3ZRvDSpzvICdtBkdHsJxKgSNg
         baThDRxmaRhTENH/geKiZyB9CcNxfeUnv97lx8vNF8fVd8CP9uRIAmtwKWB2HwM0HHpo
         tgm1fMg4BnfnZK76UEOept7coDhqUUg1ElRuw8O59q4bAs3FG7QujdJJgwobphmN+int
         uIGdmyjFMoWbzDGbg8LEnPGe9XwLYZwF6sq0IVgb1UiDI12Xm3L4j9iNHEHSJ6HeA7pB
         SHYhxco3238TCXYGRk/I9wXlKh8iDdUUNfdN95CP+cBEl6SWpvjfIvY5ko8RnrwHIbL/
         Ga/w==
X-Forwarded-Encrypted: i=1; AJvYcCUN3dNRIiygJ1NaKsCu26VciIyNIVnOqGW+qFxjR3+5Mp9p46AKcu6WgOWULxMq88WyFIcQyMmHaqE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyv+FoNDw+ODR68fMXH2DAOSCdoPS1XGcRX5hUZGis9GcTySjNy
	8qwbc3rzBz9RIVKyHrOJJjF2hGkIIyvYJrr9wCrwbWplEstiBBlx6I3NLcso6Ok=
X-Gm-Gg: ASbGncu2FEqJ4o9hfaw2n7J3qjLLdXo2O4kWgkVwaMT/L65ns95fKkiuJCobV6jjQ6U
	tZ+6+29RE6iHeWWS+6capHNWOCf996w3GzF1qMxPmF+Ud1mpRLq6LOmbtNrRPw4+rr302QD8XPf
	9fkSuYsUrbkx/Z+gYtJXOXMik2mAB82G2/Y2sysYqyeeVuKdL2ix11InSV9iFiWSnsAq8PoEU3Q
	keeJHw/eL01g3GGnzjnn+Q0jlfJOXNaxYNak1hJdyP3fspEA6kFKFIU
X-Google-Smtp-Source: AGHT+IHnLFH8otYdkrgR9N1j4TKNMFcyzqclQ03/greEidtqVylxjesTpEGHQLuz/X7sm6+/XeGXLA==
X-Received: by 2002:a05:6000:704:b0:385:e3b8:f331 with SMTP id ffacd0b85a97d-38a221f9c89mr55461325f8f.14.1736265335438;
        Tue, 07 Jan 2025 07:55:35 -0800 (PST)
Received: from [127.0.1.1] ([86.121.162.10])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a1c89e2d2sm51494493f8f.71.2025.01.07.07.55.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2025 07:55:34 -0800 (PST)
From: Abel Vesa <abel.vesa@linaro.org>
Date: Tue, 07 Jan 2025 17:55:23 +0200
Subject: [PATCH] clk: qcom: gcc-x1e80100: Do not turn off usb_2 controller
 GDSC
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250107-x1e80100-clk-gcc-fix-usb2-gdsc-pwrsts-v1-1-e15d1a5e7d80@linaro.org>
X-B4-Tracking: v=1; b=H4sIAGtOfWcC/x2N0QqDMAxFf0XyvEBbmJb9ivhQ01jDhpNmOkH89
 4W9nQOHe09QrsIKj+aEyruovBcTf2uA5rQURsnmEFy4O+86PDxHA4f0emIhwkkO3HQMWLISrt+
 qH8UUOXHbRupyANtaK1v3/+mH6/oBUlijA3cAAAA=
X-Change-ID: 20250107-x1e80100-clk-gcc-fix-usb2-gdsc-pwrsts-a8eae668c7d2
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Johan Hovold <johan@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
 Abel Vesa <abel.vesa@linaro.org>
X-Mailer: b4 0.15-dev-dedf8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1153; i=abel.vesa@linaro.org;
 h=from:subject:message-id; bh=PjDOhgrKG6iaPq/ljTnv08K3Tt3+ljS/3Zo3ZnBspMM=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBnfU5ymyn11JB07fkANMbhPM38aGpncyv9oOB91
 stB0cdhSA+JAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCZ31OcgAKCRAbX0TJAJUV
 VnyqD/9WzdCOsLTMWvb+LFmv25a9ALOMGDvZkh5rrlXFGboztP1f1Uz6Gb5y7CyOpQkv3YVCoBb
 6P831yjfAYyiqWoYQ2ncNmzlDRknbS/yhtT1Sw3x6hPjmDnl4g1MRruxO8LaE+XMjc6rvlMjKhg
 aQ99kjMdd6S2KMs1VJBbnmPxrwMJTIx+BwLsNTNis/s38J5kknmL+t5tWN7nHlliUNTCT05dR6U
 AnP2aN/bvcYpv8aX1Go7WOxnqZkq1DOGvJ/K2Xz4+YkJcfsFRYp2XATsjFiztGjnkMymfOnCth/
 SeRtcf2MV00Fb1JbCPK5+j0ZamPHnQHsZSWUPH+yGZwc1VmPNNp5jV1xekYVw8EoUTtKzHFEoFX
 7bsz/GUa1+PO+h6kvvnllw+Iu8anGgv+xtG+lUd9lXomvgF8fwAd/QsplAdySNy+Nwvg+UsNzga
 abYjGykt3dyJQvuNiab0fmwrN93eyu8qOp0xAS5l9StLismFMZSV6PNH9kpD4COC6jGOZCYdg9f
 6aAZa8GFv5a2gbq+qP6TmWYDopmPSdtBqd8p3ZbLBJ9JffBLXsjfGAJOnVzPf3dyQ4n6DoH6REa
 nDdu/28NUzM1VIVqfqTAb5sZFxlgKgKmxMX1X1r/8bUpCNbBcMywPCTY41wGaB2jHNPeVXacaCn
 fEfkia/qopJr/rA==
X-Developer-Key: i=abel.vesa@linaro.org; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE

Allowing the usb_2 controller GDSC to be turned off during system suspend
renders the controller unable to resume.

So use PWRSTS_RET_ON instead in order to make sure this the GDSC doesn't
go down.

Fixes: 161b7c401f4b ("clk: qcom: Add Global Clock controller (GCC) driver for X1E80100")
Cc: stable@vger.kernel.org      # 6.8
Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
 drivers/clk/qcom/gcc-x1e80100.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/gcc-x1e80100.c b/drivers/clk/qcom/gcc-x1e80100.c
index 8ea25aa25dff043ab4a81fee78b6173139f871b6..7288af845434d824eb91489ab97be25d665cad3a 100644
--- a/drivers/clk/qcom/gcc-x1e80100.c
+++ b/drivers/clk/qcom/gcc-x1e80100.c
@@ -6083,7 +6083,7 @@ static struct gdsc gcc_usb20_prim_gdsc = {
 	.pd = {
 		.name = "gcc_usb20_prim_gdsc",
 	},
-	.pwrsts = PWRSTS_OFF_ON,
+	.pwrsts = PWRSTS_RET_ON,
 	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
 };
 

---
base-commit: 7b4b9bf203da94fbeac75ed3116c84aa03e74578
change-id: 20250107-x1e80100-clk-gcc-fix-usb2-gdsc-pwrsts-a8eae668c7d2

Best regards,
-- 
Abel Vesa <abel.vesa@linaro.org>

