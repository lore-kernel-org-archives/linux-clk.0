Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795779702;
	b=t1w41PbMClXA5ElKZt9zG7E9PdEnTuJ8wL7fxPDqyWxGVAwn8iWtp47sNGCbvrEvqBAv
	 ZxzxYy/wbsFa+kiZQvDwPwW1phkV8yKB391WaDM3UzoD06Wy9F6KxPfLUTrDv0amv0BRv
	 BT4eQ8ttJCmdkm5j80AaZHXbh6ZCwakClJRxh9TfigUucKSKo/4Ho6E96UKKbnNYtV16/
	 wsAD1Y0Bm49I2/EJ+eJLOoLN9q/vQ/EkRmrpH6J1gw5XnswsX3Ra0SUYBI2O6fMFeBkrJ
	 aHDzUzBDV91fOLO+wUJxoOZPXCpXPgwxhjXr6wZrfWw1KjZC+vhnIOQfAPLPXahbNCA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795779702;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=GZ05oO4YTSpT04Ds9K/avLZv5nZ4BZSN3UPY5ipnDKw=;
	b=CROrsvzzHhYzqapjMJb/Qhr9n+bdyQt2Y6g++6V/1wayifkj5xoG6skkps9weWF4C+wl
	 KmcxXZr1R4ecHYJjGZdiWvUM7DU1d0pqb+GXOWPol+Il/1Ypq3iyfEHh9AGvK7DB5/Fqp
	 Hk/NMmLUEl2QzhUy5nPmszC3c/LNmlV7XIk346icCM6ZxnuZRmAQuSr0Ge+URvC9cj0lZ
	 eAWa6F9YNsMMEu+kdZ5VuzRCcLbc2Fje3DljS35FVti7b5kLhGFeJ+yYIZ54Ug0q963Wk
	 jvB9VfiYlhCxM6G0Yyn/GMRVeSW4SoBABAp4QXvmkoUF2gRqhAwuQZSJUBM+/FY2IzQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=oVDxxVWj;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UV6NjaRC;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24BCC606A686
	for <linux-clk@vger.kernel.org>; Fri, 27 Nov 2026 11:41:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 24BCC606A686
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=oVDxxVWj;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UV6NjaRC
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ARAp2m81961901
	for <linux-clk@vger.kernel.org>; Fri, 27 Nov 2026 11:41:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=GZ05oO4YTSpT04Ds9K/avL
	Zv5nZ4BZSN3UPY5ipnDKw=; b=oVDxxVWjt/7YI1pynIUkqfMVsusntOWqcekg4C
	eGGla5+dNVCQW3DRpPA6FmFx1srIpryCKVH0xfn7NQ8PaWESWaDx+rvskF1MwAuz
	vn6OKQYI3rE/2XucA5D40VlXpnVCH4KGCWNc2Dy224ILMLOVxE3UeSAwr11rYlNP
	AyYEt+10u3p81c/VyOdwON10f/8cbnhYobx3F/Hj6RKbWftKK9mxRkonLT9MK/vn
	oQrURZkOLGCMSmnVClnGHebEYPalCq4eDa2x0vN+U8NRVhnRz6BGKhACH5tvh7U4
	NZhHcIYaimlVyFC9e0pzZmPGsPh/mhxms+hoAVF4l41t1c5A==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6u4htucs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 27 Nov 2026 11:41:41 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f2005ce21so1229890685a.3
        for <linux-clk@vger.kernel.org>; Fri, 27 Nov 2026 03:41:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795779699; x=1796384499; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=GZ05oO4YTSpT04Ds9K/avLZv5nZ4BZSN3UPY5ipnDKw=;
        b=UV6NjaRCjQgIj2AmzkRdp0SjCOuxw2YFouBeS73E0vrRSxm1YMl1x3LIXIUpAPy7do
         NtwbkkoRKyxfNP/2Vtwa/eC3WvMkMayCFofLyBY221NZtchHu1fF8H3ySmmxSZ2BU24G
         jOxs/oJyvMqDmPNqCL0rbFdD43yJvmsH246f5vtvb9WOWHNNq6NkcWk1ZX3uQPKZsZiv
         XN/oyi7hN7pe3Up0wtAA4NMd8NJ+LXeL6WiWm7NdU4kXkVzlyHP68JM2slxF7E9OHhRm
         1d5pyh2ytc/F+SLhnYSniXP/S/LqBmO2lLrQA6JtgSeXQrBWNfAB67V4FkQDSXYYJt6v
         IOxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795779699; x=1796384499;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=GZ05oO4YTSpT04Ds9K/avLZv5nZ4BZSN3UPY5ipnDKw=;
        b=kC3LlZyo30GjOaGAPDjqT2Zo1iSeaZXoHWrejreeY5F1Et634XJVzyByO/CQl0St5r
         OkKXwMgpEIizO6cXvKO97Eb+EZU068r2MBBO+WSOVOaj6Zv6KVdw/xc5HPSbK4bbREgJ
         3l5/Sqbr8Cwn2mrvYK2VBvOrBcmzwCbT5qHTLOrkdRwqpIXiEOMnTJZXQqbg3yzWtuhH
         QN12JOuyXKlo4R+CRE70Vbhq5A3bhodwK5LE4qAvlfydLRdibVVQb3/gvpoWu9KzuFQU
         51kHzbT0WgoaWrubT318entkoR7daPt++759v86uCoU3I/+o75zunNa6div5tOHFS4w3
         wrAA==
X-Forwarded-Encrypted: i=1; AL+hErGndImZiVroThpPa+3FrkQI74rj++5PJRDjM3/kk1DhFFqEt6l3YACHh2LOrR91bBua5qOnd8tLz5w=@vger.kernel.org
X-Gm-Message-State: APuU4Z+xYQOHxAQgvPxHdLilTuTdoVOVHnEM35PbJeYrsCu5TlrplqRH
	LHboyhQqPqp4EqSrOgaQtlNlEkBWzwYa2Vwu+zhPtDAQKtdpTNaEg6VG9vT8z3siD/OdsjVQ8Xt
	hDWH9eg+t2tWgUEOHWUvsBDQxKNf42w1kfi5pt+A/UN25l+lGEQ5WX+ABS882yHU=
X-Gm-Gg: AZFdTZeLXPKZCqSOzCBIUhfIoLaB3rfAI5BGJOl9mt7HkaqX6dkzRCKLu5tLDXeXVPU
	a3kKtWfPXYvoEeU7NWRuJECgknxFbN6eVcRD7x+veVolBWKP0y5HZTSdZ06gdj2UyvtS6B7alJl
	ebwY+4Fvypups5SuQKq+WF/3TmA5t+2aH606FPk5G1SJZhceGiwkquoL0fhUN+HEoPgXbuTWHY/
	6ehh7KJvqm9HoqhMcRNoSZovruhcfH0o+E2rZEeuLxgyfp8s51ELH32YFnP0eO8t2fYJZWCchl/
	JzWcEjl/wTbuGQH8En+ICMUOR6hZfow6tRXK9K2F+GtnZuy63eJXKa6AOCv/BYWrfqVzTJul1F5
	ODkuwOxhbKHpaPL/zSS2dMdyBBfztpUQhmD6RkuOlbLU6dvP9vwsA99xtOSz+rkkR7ummkulyS3
	2rXWw5M+CgMFcKKjgCS2XJLcAAjGhK1gkttZuAg4zKJjOKIzujjaNamDiCFyw9nQA=
X-Received: by 2002:a05:620a:199b:b0:947:7857:bb73 with SMTP id af79cd13be357-949bab0ee8emr4421403085a.63.1795779699220;
        Fri, 27 Nov 2026 03:41:39 -0800 (PST)
X-Received: by 2002:a05:620a:199b:b0:947:7857:bb73 with SMTP id af79cd13be357-949bab0ee8emr4421399185a.63.1795779698830;
        Fri, 27 Nov 2026 03:41:38 -0800 (PST)
Received: from brgl-qcom.local (2a01cb1d00dc7e0089167b9b97a26c96.ipv6.abo.wanadoo.fr. [2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab65cb41f4sm45137049f8f.7.2026.11.27.03.41.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 03:41:37 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH 0/6] clk: qcom: add clock drivers for Qualcomm Seca
Date: Fri, 27 Nov 2026 12:41:29 +0100
Message-Id: <20261127-seca-clocks-v1-0-1781298e658b@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIAGlsCWsC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzNDQyMz3eLU5ETd5Jz85OxiXSOLVBOTFBNTYyMTQyWgjoKi1LTMCrBp0bG
 1tQDB3j4SXQAAAA==
X-Change-ID: 20261126-seca-clocks-28e44d453241
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Tyler Baker <tyler.baker@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1843;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=MVKj71IQINUpCIFknUYnCMbOt0BCNz+psO47csbCB4g=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBrCWxw7IMxd0JvPeN3gybQzd2kn6MD0/Kl8ygGo
 5biI1HyTbKJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCawlscAAKCRAFnS7L/zaE
 wxybD/91QEsPl9W0Q2ozDzIdYqshSwgdnK2Kx0mFMn/D75AyZq5XzwXWJUYho0mshE49vZP0KCJ
 YZ0U1dvZqffK2rdz0jvuU7GozvUglHJpF/Y5+EcdMj84fvz/GLDJqxEiYrqfa8PYierxmMfCVs0
 8wi7y66FB0VjjgzqoQdXb19KZTQapcPK/IOB9arNn1PmXjtsLOc/tc+rD3u4q7q1ILB9gsK4yuT
 BKb4LPYsTR7Rw/e+YcrsxcAcnf2Awmwo/0+9yuVCn0QImWFSHdoeOsUJcmU95fITdpt+D5iEJ6d
 PFieNqoMBwLzDZd2QKr/Zyc7fJsjMbxY0zU+XZ+OCjyKATtDjNv02g2bCyOtGrXJLXBuQ+qHxSs
 9FabWYIbuct4mSe178qo2HuJn0wv9xk8OVMDIs2VH+Qa4OVNiBbmeFc7HywbC5mRw3AsUsWb02f
 Z6HqfhwfCswNhiA1Payq3Wqh9NvR70CJ1Vwq+I4LlDMcZ+XW4oiAkFQ+vgQrwk2OCHe7PImBa4X
 AN1ajNKaWjj+UpNu1WRGpVhnvvWcBcLdid1c9JZe2m7s2fwYCYh0OA1m8jTY4C2lM99cQ+HdhWH
 MeV81EzbFo6g+ZjLU18y2NBWRLj0VXnKgqU2TeJevQHbhj4Zf2QlI0Tv/kkW60LSKqJN2QpV8vo
 Dp3BnorYvEoQSsw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDA0NiBTYWx0ZWRfXz+s+uqfrtw7C
 4MEgxV2zILE6d9LHbkRwq9hsyKEuWCE9GmhxVYESIuI8NMlXgAbEi/QGZXwiV0X5oUA7xMyn0Lt
 LMngoHvYmJ1KF3i6+El8HaMWX3fk/2o=
X-Proofpoint-GUID: WPu-hQgXEPsWW-qXnm9ZwTf5gHTC9b9H
X-Proofpoint-ORIG-GUID: WPu-hQgXEPsWW-qXnm9ZwTf5gHTC9b9H
X-Authority-Analysis: v=2.4 cv=M9fYuCws c=1 sm=1 tr=0 ts=6b096c75 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=ouYIBIRpUQI3KAHfuYgA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDA0NiBTYWx0ZWRfX4w2KFKvpQlae
 0WE2/HPdnqQ4ob4x+L9ZOH2gMiezJeGw9m/uMawFz7NJ5sE5LcR6R0Zq+7v+DzpRf9oXkqqcXaj
 lesgc65ml0u0V1ahvB9zihWfvSyIAZdxI+CvjEPKvJmD62P2QcBOf7fgvmzVIiaeonNNT3sudAe
 729JcYoCPm/+PVF9zb5rnvlkLSam4f8oCboHRbtauxg/57Dah8xCcB9Wlo0855QBbA9zsu549qz
 tiC86kCWifi2kFrqIUvTQHGserIBzRla3ZaLuHHG2wQ6eWWda5SY0mKd7VJhmeOlPqoeX+r/S2H
 Z9LESW4V6/vk65H+4aD9Fp1bZKSaA/BHVsPWLvgVrkMw9LJ/ADezf5SHws3WwyTtx8QtSF/DYPQ
 PSVeq9l6UQl+3VPVDNl+mTJLrlYzvkrlwzL6EFNbvxMx2mL3o4MfOZzsy7+S6STJwdGFQBO9p49
 hCySUqpPXz/qXDRXDxg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_02,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 impostorscore=0 suspectscore=0 malwarescore=0
 spamscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270046

Qualcomm Seca is an automotive SoC with 12 Oryon CPU cores that's a
slightly less powerful cousin of the Nord SoC.

Add the negcc, tcsrcc and nwgcc clock drivers along with bindings
documenting the hardware and update the RPMh clock driver with Seca
clocks.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
Bartosz Golaszewski (6):
      dt-bindings: clock: qcom: document the Seca Global Clock Controller
      clk: qcom: add the Global Clock Controller driver for Seca
      dt-bindings: clock: qcom: document the Seca TCSR Clock Controller
      clk: qcom: add the TCSR Clock Controller for Seca
      dt-bindings: clock: qcom,rpmhcc: document the RPMh clock controller on Seca
      clk: qcom: rpmh: add RPMh clocks for Seca

 .../devicetree/bindings/clock/qcom,rpmhcc.yaml     |    1 +
 .../devicetree/bindings/clock/qcom,seca-negcc.yaml |   61 +
 .../devicetree/bindings/clock/qcom,seca-nwgcc.yaml |   69 +
 .../devicetree/bindings/clock/qcom,seca-tcsr.yaml  |   65 +
 drivers/clk/qcom/Kconfig                           |   21 +
 drivers/clk/qcom/Makefile                          |    2 +
 drivers/clk/qcom/clk-rpmh.c                        |   16 +
 drivers/clk/qcom/negcc-seca.c                      | 1458 +++++++++++++
 drivers/clk/qcom/nwgcc-seca.c                      | 2138 ++++++++++++++++++++
 drivers/clk/qcom/tcsrcc-seca.c                     |  147 ++
 include/dt-bindings/clock/qcom,seca-negcc.h        |   98 +
 include/dt-bindings/clock/qcom,seca-nwgcc.h        |  144 ++
 include/dt-bindings/clock/qcom,seca-tcsrcc.h       |   25 +
 13 files changed, 4245 insertions(+)
---
base-commit: a9c48428cbd8d96b26f92631d0db6f8519c5fcc5
change-id: 20261126-seca-clocks-28e44d453241

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

