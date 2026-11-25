Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795609960;
	b=cXxdxXb+ykgAw4qERUW240qNaWIXRwlGsFsvYItSd5B/sgFRb15dQeT1QAvZysIAQqdN
	 k+MNb6ydN32uLBct/ruI6V5rTK8uePvLEYd+7jjhvbt53jxlXAuYbtIbtcyeYmi1RBSWW
	 5vOO8ub7mw9/YHW2+xjsozQD4zz2abk+Pu1/rWRoRlewHcxAoyKirtC5+NnHHIK0UvblK
	 iW95KXl+9SZPxZx6voPUJdDDIJ8ExSpVEMjVGFdhGiPpb+lLhusrJVxKje29RJwBx0D+F
	 k4mv3/1zc0rE2lfbflB09eBMN5I6tQHJ9I01OwxMIldqNwMw93I/5dgj+4QGOowZfTg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795609960;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=AxUlajAcSM1mDpKZdVSgSkZ4R4Jb2QJeUzNxitwZ2CA=;
	b=KREHYEyWKlYlzvlyfvzbb7Icx+PyiO/9SLx79cl0k48OBudd8O5plDd6VTsXDJZXIXX6
	 0DJUnGLR8FvhMeVXLdKnX77xUBDtCIvZ/iZgKdJ4ynfC8Gh9i02H86vo8raawImnkoAr0
	 5+2q9T+yPHJK0m4MT57130j6jiYsQhfMXDLtmeaGTQsYUPBcPNLbUcrmseev6VkvBI7xB
	 mcM3Q+8bCAUSKhuqGkT1+cP6y/JmGueC2H3QeAASYdhZb+xFHkV6oT4vNZ2SxRh+s2tcy
	 ZXSstPS+Q64lhEYmU2vO0UZftgfuh1yd3+84ldryTbj0SEEaTyLdhAGFpQ136poKM9w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Jjf6U04c;
	arc=none smtp.remote-ip=209.85.215.180
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9740606A33F
	for <linux-clk@vger.kernel.org>; Wed, 25 Nov 2026 12:32:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C9740606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Jjf6U04c
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-cdadf7e248aso2300047a12.3
        for <linux-clk@vger.kernel.org>; Wed, 25 Nov 2026 04:32:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795609959; x=1796214759; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AxUlajAcSM1mDpKZdVSgSkZ4R4Jb2QJeUzNxitwZ2CA=;
        b=Jjf6U04cQWZ+NII3vRDrhW3MUWdwXMhKSfRtwwd4R59UmStgmNqb3pePkQ09dJ740D
         TUMwlPxIinVGwhEx8pJ8X+RA/1hyWgQDRpxDjxGw4Sr1zUpME9ezWVIkmfHwzJoOuML1
         FLZE9/m+gFmnXvzsCd3guNsf8vTsYWfT8C4PAPM8HUpa0emGH7QSieVXXqdCwWyPdkXy
         JcGGcvFlDvV31c/4jSf880N+bvOzvW64ZCO4EWUmBf0AmL/fMxzJQTptnZsJf7TESfg4
         tEKX28SXJHswIQCWJl6QTyV0qs22hIrsZdFtQiLj/zpKAGnpu7MlYGSMPWIq9HMLgYFI
         5ABQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795609959; x=1796214759;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=AxUlajAcSM1mDpKZdVSgSkZ4R4Jb2QJeUzNxitwZ2CA=;
        b=mPqqPZrpeFAHTyg3iFaV+7wTqznRtPAJ7PeteTlwrKmPiknmmULu3fFA8xmvfAXblV
         kGh9WVJjQ4mP1I4bzA9K0Ih3Wl/v+QnH55st8qIq75CBuKyJYPSwpWU7UrQngaPtyEgP
         FaV84Du6dnFwFqSy1NHzvCM1A0uROejhjE+lm32GHwdw8yV6p02UV1CRoLUGr/lH5ovV
         e4KOrnS7iyzHY9yjvNYA5Ivn+Rj7cc/80GyKRdNZez/oh+hKsZU71n2qL58UAtUVrX3I
         5Z0P3QwiStHe3/vn340UXGPVdSvUaRynBwub+4i65hPVFnTdLOejgdY9NlUal9WZ72no
         feDQ==
X-Forwarded-Encrypted: i=1; AL+hErEXRHE1pg9Z+mF4pwS7rsaCwwrtIvWLQGy2uljeioWfsyWlZv70iauB/dpGwFMjXFlpe+eBgcbkAfY=@vger.kernel.org
X-Gm-Message-State: APuU4Z/FOylWzKA10vH5P3YAoEhm3mcfdcB0/f4s+5LyaDcUhSCWg/ps
	TWP/iYhoGrVn4l3CKDo3AfI6MEIs+HpfoRC+BnQRLXOtRNZ6g7LuYj/V
X-Gm-Gg: AZFdTZdJ1/c+gM9t5CA0v6JcPmpMRlCSbAUPD9OBdb7s+IJ1hshpRSt68WQSP6rF7q5
	AVZlIFn8U7c3MgfKuZscpxp4JAW7BmfOL4Ls+aGA0DkSwFzZObMThcNtbRwjaFdBjIzE6fQ7/ky
	mncKj5o+xkVKqA8uF4PP1CSf3D53mtgX6WKF8tp0OXMwZn4mnNbm3/cvAaJXZlm9NoKBjBnf1SA
	8ZE2BdckqQIue5CTqSXYr0GAA76Ebb2IMTeXNUd72H91LYqCtCJldLUrSmHAe/Avhby9GHezkTN
	7lD7P3Pwi3H3jkbWpjeEZm5ro4tlsgVqx735l72ah6uFJf6phWprhbIhJ2f24XEyIBh5mrCjggK
	Fpr7uV17kajL58033s9f9v/9wsstHE+jNtfFXEF8H38h/6suRmI379JUG9uHSg7yULLJjmKL89+
	QNxEgWMOcCpDHBkprYufVWr4KBz0EBlkLErXEFIgBuL6YQGY7SkWCIZ4DpHG1U7HY0+IMryLot/
	R4tyPLnW56yvoCYUpaXoPptu+6U6AOyb8okDs0J9j6gcqItR1hUO6Iy8GpvnhwLreKCdOOSczJX
	CP7zaIsbko/rLHgYtmJYJ7OPzN5YOSuhdfvmjHwFIljj6djY
X-Received: by 2002:a17:90b:1641:b0:3b4:fcba:8c57 with SMTP id 98e67ed59e1d1-3b4fcba964fmr1130708a91.20.1795609959126;
        Wed, 25 Nov 2026 04:32:39 -0800 (PST)
Received: from localhost.localdomain ([103.118.130.202])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b44b792474sm12698366a91.3.2026.11.25.04.32.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 04:32:38 -0800 (PST)
From: Hikmah Gumelar <hikmahgumelar@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	u.kleine-koenig@baylibre.com,
	Hikmah Gumelar <hikmahgumelar@gmail.com>
Subject: [PATCH v4 1/7] clk: qcom: gcc-msm8953: fix csi_phytimer_clk_src 100MHz parent
Date: Wed, 25 Nov 2026 19:31:40 +0700
Message-ID: <20261125123146.379057-2-hikmahgumelar@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261125123146.379057-1-hikmahgumelar@gmail.com>
References: <20261125123146.379057-1-hikmahgumelar@gmail.com>
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The 100 MHz entry in ftbl_csi_phytimer_clk_src selects P_GPLL0_DIV2

with a divider of 4, leaving gcc_camss_csi0phytimer_clk stuck off on

MSM8953 platforms such as Xiaomi Mi A1 (tissot).

Switch the 100 MHz parent to P_GPLL0 with a divider of 8.

Fixes: 9bb6cfc3c77e ("clk: qcom: Add Global Clock Controller driver for MSM8953")
Signed-off-by: Hikmah Gumelar <hikmahgumelar@gmail.com>
---
 drivers/clk/qcom/gcc-msm8953.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/gcc-msm8953.c b/drivers/clk/qcom/gcc-msm8953.c
index 8fe1d3e42144..8aec5600e837 100644
--- a/drivers/clk/qcom/gcc-msm8953.c
+++ b/drivers/clk/qcom/gcc-msm8953.c
@@ -964,7 +964,7 @@ static struct clk_rcg2 csi2p_clk_src = {
 };
 
 static const struct freq_tbl ftbl_csi_phytimer_clk_src[] = {
-	F(100000000, P_GPLL0_DIV2, 4, 0, 0),
+	F(100000000, P_GPLL0, 8, 0, 0),
 	F(200000000, P_GPLL0, 4, 0, 0),
 	F(266670000, P_GPLL0, 3, 0, 0),
 	{ }
-- 
2.47.3

