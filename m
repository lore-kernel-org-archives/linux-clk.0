Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E3D73B3C17
	for <linux-clk@vger.kernel.org>; Fri,  9 Oct 2026 12:19:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791548401; cv=none; b=N5CIGhBGIrrD5xOOlsnayFA49fUFIV0h3f31rRgWP7Ceue+WZtIj9Jz8YC4sQiDPzMBdXRuSE+/EDqwz8E+ooNmDB15hmIO+tNidomUr3Rz+oaR3Artdjq4Y1VO+bAE02SdVrnIRpKnQPYIcoRbWr+1i0GzyX9bN/LdlbIGRYm0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791548401; c=relaxed/simple;
	bh=CzpLtfkGGwXrRiqJRcGIpPqye67qSq4ze3YOpFxTn9M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fqDKEa0jEGjngM/ShEMT3fhA+V0Qy4YXT/ZF9vLJidJ1MHuBAB+QiOJErW7r+6yXkd6NhEpoHr8XtmcHGAmla6aQNOtZNA/tSZfEV2T6th19qcJb/DAYeBi5ZyP/WMrTybdXMDf1I2vlld0YmYEvLPfy8kqWdvPZ/+FgGINu9c0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DBD5QjUK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QIGm3re3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DBD5QjUK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QIGm3re3"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 699BdCiC1687104
	for <linux-clk@vger.kernel.org>; Fri, 9 Oct 2026 12:19:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=mBrbuKgt+Ksrs8OD0jodhFSOayu6IsdycZC
	AqvixHQE=; b=DBD5QjUK1KbsiWam97SpZYY6vSLDPASbYZv5wXijvxfgZtBzfvA
	K6SEs8M664o+OvY01QfwtnmUfd1dpAEzIUxosBAFWzZmRB1yHuD/IoOAbcxi2Ouq
	6EeK4AcfrRV8l87XL6VZN5e1hO1lARJ94RbR44Pq0ameL7GV243i8F28+XvMrX2a
	HF1hUd9LwPKu/Ex1CAbxBrL0Nhv0oXICeW6jgWZ4a2M8211TrJ8LjAR6TKt7VdMq
	TsopKswppescV2N9nBbXAKf5XrAumhWzTKzXVBJbmXkrtnAdlp2yu+wJzVRWxi+v
	g8qyp5wea6zAhfNBR20Qflq5H80HBtcD2mg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h6yk7g4br-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 09 Oct 2026 12:19:52 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93a3f673221so1733175285a.0
        for <linux-clk@vger.kernel.org>; Fri, 09 Oct 2026 05:19:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791548390; x=1792153190; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=mBrbuKgt+Ksrs8OD0jodhFSOayu6IsdycZCAqvixHQE=;
        b=QIGm3re3q0sTDAFr7+Hrr/yJfVbBDrExjxHq1Kqnp/LrtUVLhm8j14RfOkjjvcQHYs
         FABjVACFQInm1o2GJH7cmml/WyNY0WUkTqYxZTABLFdvAt/NlJ6Mu+Uip21TUpxKsU8x
         Ptpzh+Zu7EGDALwXQ5EYjWKdYP20b30TmjRYjQ6dW4Q+1yWycCUwvz9I/aaU6sGxSwks
         AjFjBCny9y5Irwf+BvxOaGkZ4wYi7LjuvPGq87TZM0rkAEr88D2cetQTdZc555HujFOT
         ORaGhSiuvy3XGzmlFmZlBlHgt9OqpVROHWFW4h4Sm2aSSjvPv/AkQSxL7pk5Sea25HJB
         YV2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791548390; x=1792153190;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mBrbuKgt+Ksrs8OD0jodhFSOayu6IsdycZCAqvixHQE=;
        b=Iez5KG/ygEuw/anVeX6fHNKDXZYKa0LXJvAreMQqgXO1EDilXp69JYejeqZFZKtvSC
         20dGijXpY11msJXPgheBNcTyua/ynmXnrb+X+8RrpeBNd62qGNd1ca/XBbQGp5ymi5Br
         xjn5fU7KpOhXrohEvy40DBp9dd/uxhRYGGjUnXs20l39n/SHU0RkiYLixsJR21B0N8Gn
         ilDx1XmdS8w+UMyIgfSZv4CtSu22Quq8zeHOC9N0NpMA/8/RfUCAuh4VrWOtFqhTe64z
         po6aeIRdNBwkIKcrGhidAwiOjUgFMp0e8vkYGbpK495eA5qH+0jYzpA+Yr37cgGXftag
         OGhQ==
X-Forwarded-Encrypted: i=1; AKwUvBxHLwt0aAmTuwwE539BmW/cfV2ipkZA+bgQzpedaMOLjvwv0r6CTBOTBtQW0wgcJC9gKF/6bExy2zI=@vger.kernel.org
X-Gm-Message-State: AFuF++lAf5NgY3wn/IDhmDGgAiTmcJFYza2UqILXRuHOZ6CtbOijPlcn
	bT4fz9ZQZU16zg3yx8kBcOOnWUrEhaEO1Vko9J67R/s60EsR9/Q47JWuCIXJyIrO8NQMcOG0jbm
	IyyRqfl4FsbdmRkY2fqmGVtuwsK5TidbbhfBraxOu54wAMkK107scV74O6Iw6Rro=
X-Gm-Gg: AYBFou3hWtpBWzWvF/wlfwOBz+mAc2EULkq11DCP0mYEsx3MkFNKNAF5xwvXJbqEjdc
	BQTeWMsHDj4bD6mNzmW45N+lW/eXjrOlcbeVH/NvkIJwVChkZBSnHX4c7aK/VXE0nPl6uUL99qd
	L3oL0c3UEeDr8ere6tbUqMhaKCV08B5RJgLpu8G/0O8OYWwBylbUhrOe9ouKd1xZLP2KcYEPgDs
	0WADbOsopXGklV7XFUzsysazjVEj0UPD9KLI/ogjxmqnDOm3EniKmU6YiuMRj7sHcKpbWdQ6HEt
	vVaFsGC3WZf2dYjdAl9pcf7o8Zk8XrLjyMB5L4bDFTB1RofZpOLCbS0m8pOpBjz0qHGzyB3jK0g
	WtqvWroCNdUopMrSfCom/wZFGirQ=
X-Received: by 2002:a05:620a:6306:20b0:93e:c12c:fbc5 with SMTP id af79cd13be357-93ec12d0793mr98793285a.82.1791548390297;
        Fri, 09 Oct 2026 05:19:50 -0700 (PDT)
X-Received: by 2002:a05:620a:6306:20b0:93e:c12c:fbc5 with SMTP id af79cd13be357-93ec12d0793mr98788785a.82.1791548389566;
        Fri, 09 Oct 2026 05:19:49 -0700 (PDT)
Received: from hackbox.tail37bb1b.ts.net ([188.27.161.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18e481993sm40485285e9.2.2026.10.09.05.19.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 05:19:48 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Mike Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>
Cc: imx@lists.linux.dev, NXP Linux Team <linux-imx@nxp.com>,
        linux-clk@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: [GIT PULL] clk: imx: Updates for v7.4
Date: Fri,  9 Oct 2026 15:19:36 +0300
Message-ID: <20261009121936.1882361-1-abel.vesa@oss.qualcomm.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=D63SufRj c=1 sm=1 tr=0 ts=6ac8dbe8 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=EiYrS7xXfcF7w+nkr41hpQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=VwQbUJbxAAAA:8
 a=dMgMsFW6-PjHuSmHTgUA:9 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: 19AA5FuP1Tt_3-XLXYUBUft6-bToTzhk
X-Proofpoint-ORIG-GUID: 19AA5FuP1Tt_3-XLXYUBUft6-bToTzhk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA5MDA0OSBTYWx0ZWRfXyfat+9IQaM9i
 b95LSe89szEC9UGJ/cLFEzRsz6/nI0TOSXDtpfpFwDChwL/Onu3VlddDILItmbGqc8mVs0bX3Dp
 RGQ+u1lfgNUBL6cv8eFvGuolwG+DWAh951Z+laqyV60pCop1eXl8PiE6JiHM5LZz0W4SLIVJUDR
 mlfc93AgO+eVdIWPJDas47GxB3eOgKu1UO4TE8KwfaTORVnEeKFVsAQMdeXw07a+RQMsuDYBtFe
 k09lgwbDJV9zj5FPNMI6trLlWpVdu6AT+cZ3WcWNPFKi69mNBBoATLMVyLpGu4FYfDtr2v8xl5Y
 MKzz9LdjJZQw6l5WV3q1x66pxoFtoKNDzcpMTRJw858l7VUY6t5kMWZWsVY3PHSO78oxMZlhuji
 hZLH4uEHLqrz5sFgt1/gYnB9wNGaEvSyFw3j5PkyhCw+zGY/Pvu2e1Y3XpUGrEhl+ovacMqUSVL
 b/zgPNmW7WDjQo9VtLA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA5MDA0OSBTYWx0ZWRfX9FxB4gu6kRZH
 otOrJtriS2kZMXiAQ4hUQUmYub5VnsvZ2QQVHt9IPqcQixi5MRRWUQN+/Y//lnU9nvrfGgg9VzG
 RnuMESRqmXik1i2SbT/OjHe8tV3UScA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-09_03,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 phishscore=0 malwarescore=0 bulkscore=0
 priorityscore=1501 clxscore=1015 impostorscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610090049

The following changes since commit cee9395acd8043be0644b25c34bfa86623f2b935:

  Linux 7.3-rc1 (2026-08-30 13:34:40 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/abelvesa/linux.git/ tags/clk-imx-7.4

for you to fetch changes up to 52d4d1b26a5bc64de95099d0a3dd8b90dba1f3a3:

  clk: imx: Fix clock reference leak in imx_obtain_fixed_clock_hw() (2026-10-09 10:55:51 +0300)

----------------------------------------------------------------
i.MX clock changes for 7.4

- Propagate busy timeout errors from i.MX93 composite gate enable.
- Add 350 MHz support to the fractional-N General-Purpose PLL for
  i.MX93 display use cases.
- Fix clock reference leaks in imx_get_clk_hw_by_name() and
  imx_obtain_fixed_clock_hw().

----------------------------------------------------------------
Linkai Gong (1):
      clk: imx: composite-93: return timeout from gate enable

Mikhail Vaniulin (1):
      clk: imx: fracn-gppll: Add 350 MHz support

Wentao Liang (2):
      clk: imx: Fix clock reference leak in imx_get_clk_hw_by_name()
      clk: imx: Fix clock reference leak in imx_obtain_fixed_clock_hw()

 drivers/clk/imx/clk-composite-93.c | 11 ++++++-----
 drivers/clk/imx/clk-fracn-gppll.c  |  1 +
 drivers/clk/imx/clk.c              | 15 ++++++++++++---
 3 files changed, 19 insertions(+), 8 deletions(-)
