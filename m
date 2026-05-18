Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49EB33F39D0
	for <linux-clk@vger.kernel.org>; Mon, 18 May 2026 10:34:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779100497; cv=none; b=TVoybVeg+AQ32/l9O+aBkcnNXrgHfDfdZwSAXVcg4E+VwoaxT+rmrXEG9YWSNWBjpLi7Liv4K620WDfHj1PpEK+myn4WhcETMXFWF+05YsLz96fSU92oxMOgOr6tFThYYYs1RUay3DQxF4UtHmZ5En6DaH4y1aapRn0iSb45ETU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779100497; c=relaxed/simple;
	bh=u8v8CNSfX49ylyxzKrYVQag0107VfDC8fMtgShe9hkk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=G6uoUuRa040ttia78P1YKNmfE5YpqoV3eaTybW73R0FN0R1Xqg5qTQuT2xzviuw/he9J19e1xJhqOp7t1oCIrZOFmh7CNA3rnNrSNtn6CJ5s9n7P0yVWH2aiWLpHq9XEkRB+Oph6B3Ep1s8mTU5epd/Vpv34QcZgMMHogjIeYXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=inGa/gUd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fQwvdoW1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="inGa/gUd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fQwvdoW1"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64I7agPJ1462932
	for <linux-clk@vger.kernel.org>; Mon, 18 May 2026 10:34:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=fDwKWlwQGOochU4nwJPd+3
	5tl+JrVx7kQH2npiXLb6g=; b=inGa/gUdIRmxKU11dDaXcNQDN6nxOvTlvzT001
	ckorbJAimcW68YG/JGsT6Tw83TcqRNlEAT7O11v39yedq+/LEsyNzFB9WgVHmhTI
	3nLdMkdicf1ruPNfUkCgx85wuZREQJld2NmtOULPU7pSzVOfF31tZgNbOv8jijRR
	1Vq5KctRjvXsrKKTBl+vk+ICNh3ENM8LbI3CXV1hFL+GqtcmUXWO4GpYruDIAaDk
	5WYutDQ1jNA2USphLZTxVWD1F0f+kRvhF95gqkC/efWK3R6M2p1AGkzJTkVFT5re
	FakM0EQE898ktLA3tTfh6cBMfQs9cmdwVZCM3jVV8QB49KjQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e6h0g60ac-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 18 May 2026 10:34:44 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50d890580e1so50870201cf.3
        for <linux-clk@vger.kernel.org>; Mon, 18 May 2026 03:34:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779100484; x=1779705284; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fDwKWlwQGOochU4nwJPd+35tl+JrVx7kQH2npiXLb6g=;
        b=fQwvdoW1s+pQkfAvOq31XrgY3E9+gj0iobYhnSn1JW/V31sI1O51HCc5yBXuGciydl
         o0HSoDzeRnkzwyaopefPpRp2wunJuN3XIW37+kTBkkjfLSQLLtDX1fndh8R3TZc5iC2M
         mKCIgVzzMAcXhkGfDb4OiA2vrqwowgPtU89L9bLOP9IdI7Y8Ik8iRMLGb1yygZMz4KMR
         17qiYj0FMAgeM5bkP0WQSBHfDXUVCeI3aEpWiaFQX3zqr573rGx6dJBtg/QzXJKTSx3H
         qQOCEsncgiR9VTAFFcpzM+X6lCwB/4kYuQeyFeTIM7xOYRXPkF2sTwokeivQ7kSNVgyq
         ZwZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779100484; x=1779705284;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fDwKWlwQGOochU4nwJPd+35tl+JrVx7kQH2npiXLb6g=;
        b=RhiZpZPH5eFF1SoEYabygSlOBwzJXYNmPBdgRcJWQhBS6kh8/BI1F5GI5IlhnfdKyb
         HfCWw2UX3GFnfOeXtD0YBJU0VdvrVvnIngVQvRcCk43Ao751ds68hM55gkzQBFQ/1moM
         PgYrFfvYaqKomHu66pioH0WMNSxE+mwPBFzAXFlX8APCnUFrjIS04cb3ckW5H6voggmh
         GV1vRAq+h3bay1/18XZpmE1ZnpB+2UVILs2RLk+5a5LP4L9kiYnYVIv3uxXLRJrEwlB+
         KHeMNDeN3q4E/MIWVu7IgbVj9sT9PILjdlx13FOXGzbexbImmABkuuwx0+FuuzRBU0qE
         9yvw==
X-Forwarded-Encrypted: i=1; AFNElJ9GeY3HfsjcuWHlMOIylfuwTjn+vBC4mrytaUn9pk/BXuNCei5Z4R5fUkitEyo2Xm0uLa9yAHQzVVw=@vger.kernel.org
X-Gm-Message-State: AOJu0YxGnBUXXvh53gKnKtVStbbu8c21oYcPyhVyT2gN2mryQrUVGeSY
	pde9J5tyvahCGvu2s75eOePd2IAMAuBOfYegb9wo4oUQ7zb8wQ5JYDDSHxHzD02/0xhqqJ5ttxz
	W41jbQ1FH4+CinTO0uYxnV5tCOF0gbllED6S8n9E2a8OcunEqhxGJ1k1Qdo9yawk=
X-Gm-Gg: Acq92OFg88bPb0jZpNjFrqqJbWLhmo9d7+vDq4iPxSkgW27wSIpBCkY5RQjUHfm1c7P
	I5+oZeGOASXQ0jICSTaP9BeCttWa1CZRvQpQE5US0F12w4O5ayeQUfwA7LS42iBYfUG1gKIx44K
	P2KCCGALgbyh964Lo3V7IOlJyXG3Eto/N7IiylVizFCK8dCoNdr6jYyoYY5nGDbWSxtVosl3Pn5
	PcLcd4/oGWBteyNP9MzAhehnKWU/6WWw0RI61M0vX2PRAGKL3avkJObIL5Vf8OcXsI39YUpE45Y
	PWKNnYST3SScv8P9gI23J4pt0eGjir/MX7f4M47MjacwSdgFlKj1qbyg8BF1UZJqaqFvlza1vfs
	3Rkxe6iV647eqXA4I+IVA4GzqxFGlAsslCKgun5T91fwdA0Lw3A==
X-Received: by 2002:a05:622a:1b90:b0:50f:ba44:ce5f with SMTP id d75a77b69052e-5165a059af7mr198117341cf.22.1779100483693;
        Mon, 18 May 2026 03:34:43 -0700 (PDT)
X-Received: by 2002:a05:622a:1b90:b0:50f:ba44:ce5f with SMTP id d75a77b69052e-5165a059af7mr198116941cf.22.1779100483243;
        Mon, 18 May 2026 03:34:43 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:1337:b6d0:456:372c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45d9e768072sm35654171f8f.5.2026.05.18.03.34.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 03:34:42 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH v2 0/2] clk: qcom: nord: add defines for the USB2 PHY reset
Date: Mon, 18 May 2026 12:34:31 +0200
Message-Id: <20260518-nord-clk-usb2-phy-v2-0-17a86cb307c3@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADfrCmoC/32NTQ6CMBCFr0Jm7ZC2BKKuvIdh0Z+pNALFjhAJ4
 e5WDuDmJd9L3vc2YEqBGK7FBomWwCGOGdSpANvp8UEYXGZQQjWilhWOMTm0/RNnNgqnbsWKGuG
 NsJV0EvJuSuTD53De28xd4HdM63GxyF/7z7ZIFHgm7a1RrpbqcovM5WvWvY3DUOaAdt/3L45Gx
 dS5AAAA
X-Change-ID: 20260513-nord-clk-usb2-phy-3e60fb0c31d1
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: brgl@kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=927;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=u8v8CNSfX49ylyxzKrYVQag0107VfDC8fMtgShe9hkk=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqCus7TwWaBT0ofaGoWaOHpLesP1f3TPV0zgwDO
 y5fCRTeSzyJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCagrrOwAKCRAFnS7L/zaE
 w7noD/4rz5WbbBWapkqcAYFdjgbnoSECtjcwNw0NRfeEsLn96Prwq2nO3nYA6QsLyjHaBJHCZJK
 BqZcB6PF+p8WKOrZshe+FFAn/tC0CLQ1JcLV04eaaUIIlPLC6NFzanNVszVF3nFIMw58pCrjEQ0
 1XlxW2T0gXfbrdaAMzeNnsLomc5EQ/OvOLKn6/Uld776KH0C3pcRQ0ge2kETpmfgJmAMM6XxtEb
 Xk2QZADyzUCJz3ChE9dGQG6jnAy97ECRNfq6UrPrpGHPbLdXXHz5iEWOchhqiKGU8rnrVMBxAup
 JnIm0Q6yyrYTMXrghjltXhWwX18CBGp6NrseMVxo2qND3rq84j24nggB/WzCqqPp9TSBICIDqRy
 MdUbA9u4zZz8scG74M+zy8epDmBN4tkX2LbNPgd4QBiiU7C5ZFAno1jh2YKUhrjTc2W1JcASief
 IGM1dUkQzItv6R6UGz+AY2ZLQKXAHjEisnb7/8OEjJ06dKwOMrVXoe9l209VptHYoSmkV6my1Tw
 TlIz4XU7FePSlOBlUqNBjm4Dupj0FVHtOVoO99ZM58AJ8vAW1190wPqr0xy4y2/UxsVcNYHTSKb
 xyBYvpBnKsAJJPh3IDrstEwkWjD4fxuc9FN9jaL9TIg2sp+656DTTWCaO1WVExeGTMl3VjECYLW
 6u60w3pQjVHFsFw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE4MDEwMSBTYWx0ZWRfX7WGjlcwsRAVg
 wWIIFPm+yObrhmtSRHQzA5ldL5GOhMY6ht+gTagLBCyRJziURfyTo131AkacE5Bw+DDKUCQWZ1h
 krOW46juNdUgI25z0+SevVD+hov8T9mYGaT1ZbQBaTujBH3zj3DEmqTC51lojBnUIRMInp8fF2N
 0IXZmjQRAIap4df5Cqks3PVtdKkIYfy08AeVbGhLn9QbxNwp2FEp6bdwFWJXkMRf/0ZYoEML3nw
 jZ+TNvoUZKnl1G18+ei7BlFO0E7D6TePVZif4ouoNswN3g3ARrr20NJX5sPujXVVelXHaH+seHu
 h/Jv2BavEOw5L/JyaWHzUZ+TCWvgln7HZ7cggX/XomYHOfu9S+h7iaifYl719VvW+aUo3hwn6EF
 on+ieNksKsIxF7u+iipb1XziInpoKEErl8EvXKe8atLIac/0e3IgkEuCVgTKDsmjmr87CyJKDVf
 KfVTGREdNzaVnCVMXsA==
X-Authority-Analysis: v=2.4 cv=W7gIkxWk c=1 sm=1 tr=0 ts=6a0aeb44 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=bC-a23v3AAAA:8
 a=EUspDBNiAAAA:8 a=BGJgbtQK9DYxViS1Zj0A:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-GUID: x--Y7GKIX8pVuPEDbIbFgURaPq-KPx84
X-Proofpoint-ORIG-GUID: x--Y7GKIX8pVuPEDbIbFgURaPq-KPx84
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-18_02,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 malwarescore=0 impostorscore=0 adultscore=0
 phishscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605180101

Update the bindings and driver code with the definition for the USB2 PHY
reset.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
Changes in v2:
- Fix the name: QUSB2PHY not QUSB3PHY
- This is not a fix but a new feature so drop the Fixes tag and rephrase
  the commit messages
- Link to v1: https://patch.msgid.link/20260513-nord-clk-usb2-phy-v1-0-8eafcb2d5129@oss.qualcomm.com

---
Bartosz Golaszewski (2):
      dt-bindings: clock: qcom: add the definition for the USB2 PHY reset
      clk: qcom: nord: negcc: add support for the USB2 PHY reset

 drivers/clk/qcom/negcc-nord.c               | 1 +
 include/dt-bindings/clock/qcom,nord-negcc.h | 1 +
 2 files changed, 2 insertions(+)
---
base-commit: e98d21c170b01ddef366f023bbfcf6b31509fa83
change-id: 20260513-nord-clk-usb2-phy-3e60fb0c31d1

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

