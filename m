Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA65C442B3E
	for <linux-clk@vger.kernel.org>; Tue,  1 Sep 2026 03:53:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788234822; cv=none; b=jDF4PLEjGt/Ir3gwtXLA8v0SrAypuf2FL55PneG4cYHrTW0g6GNap2IUXrAAD8Rzv8uwN2CqfFa7xLRJ6vkRhYSmQEhZ1wy+82h4q27SO0T18Uh79mbWX9yHavvBQtkCVUHyEJCeBJc5cYgDEjMRq/II2hrFm4qR4HBbfNncN/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788234822; c=relaxed/simple;
	bh=ao9W4UafP1BG4g0Oeyh5S9QeyOeCRkfK2dC338i7aKo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=k4hOHQRGWfqlvOU/K3l7UztjYdawSHctkECvRoinbgGr5MmNUxC16BqxlGPUoh9Y0xV+whHL3pVG/UaznyDsSOwFr7FUg4cpZWdnzMsRMpTTlD8IcoBklU7lOOwM3AbkZsJBUkhEIxQwqOHcYWzM9pIFmCc9nW3icZGB6SsB7G8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=T3/ovMn9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LiiddZpP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="T3/ovMn9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LiiddZpP"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6810pgN41488947
	for <linux-clk@vger.kernel.org>; Tue, 1 Sep 2026 03:53:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=YXpeDxWH6MslCcPNnJEH/+Lu+IlqwnBHipv
	rJDvshDA=; b=T3/ovMn9+m0NQPNYGPdH3JveyDK3ffMQelyaGmr8pphSb2duO+8
	Ghfjz6ckaKBdKWYxHysM/P0p1uMN/sbH9h6eOynmeqGtqmM7xHdTlX1ULf2Xpgv9
	uZeGz8+T1ttxiKOIPXMDWL9mZmtVedM6w+ieAmOUJv+i1pq564Q9F6aFi7+eRDAB
	Dcs4JJD/eGu01ij/0U7maiG/1zQptQCMFsZYUhukP1pJObnV6D6jt5s2I9mKOvRx
	sBjTc97igRE+lenr61IadTm9mtm/V24Y/5236tJmgsZ//0aAv21fxVhx6yavXpep
	+bphkIa/jSwlT23+x2AjqPbCfK496awIWjw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdfch9uug-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 01 Sep 2026 03:53:39 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38f283baf1fso782217a91.3
        for <linux-clk@vger.kernel.org>; Mon, 31 Aug 2026 20:53:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788234819; x=1788839619; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=YXpeDxWH6MslCcPNnJEH/+Lu+IlqwnBHipvrJDvshDA=;
        b=LiiddZpP3a1ePth84AFgnHkDkdnwk076sOumlmbomo6umpczjjvviuyxuKrS7IeRf8
         dZSONKhaKvKyTzpFCJmvtAaglAEUhQb2utrQQBFchzxWlNRLJIfjBkuUPJnssoXxPquK
         LMA5C3QgkblhBH1jPF/+Q6JnULuGxPInKUEJKFnqHAzIzrocX57dPUQt5bNBJYm/+y5w
         ePe1BEdQDOLlgk0vhGOQRlqKyU4IHp86MyjjwND0vJVJxBEUeP4SDihgwQeosGe40eK1
         w89n+CBrZGYrHhqSBachJ7r/uWhBKAXfSR1LncNipo1AGmAcLy7uuSymk0Mfs1Pf10HO
         YoKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788234819; x=1788839619;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YXpeDxWH6MslCcPNnJEH/+Lu+IlqwnBHipvrJDvshDA=;
        b=s4+ywHhRaLKSZjWZMWzzN9N/tAsCrXsI+AXWCthqlGZxvZyuVx2p0rGMFjFs7NYRwb
         azXE3LXQ6ycz6N9o9JoVScAFeH2Vd/fd2MtnTDY8S8sC9ZtpB43WBn2i/1xEnsnpWg1C
         VvcIsGtB0RwcfWNZ3lpmOoE6LEM+KEPDIKm0+ncwozKB3kNBwuNTKGVVB1T8dSuTJJ1B
         Y+lrC2Dgl76BbNl7NmguIgxs0XWpVYeTQ2y4RnmsF5vQKj1GNHwfbPu8MBaWV+v22iot
         +Y/jAyTsutAZNZZs/4539qgrNUOB7tJreQVrM/65I5LuDUn6X7XUcL4xX1GUOJN3o62R
         1PRA==
X-Forwarded-Encrypted: i=1; AKwUvBwQah8dwOgXcx5QLgMmTMM+QZ5vfU1wrdu7JytIZ7iDTXW9t4jwOlyXeRLds3t71X/ahIDA2Clknbo=@vger.kernel.org
X-Gm-Message-State: AFuF++lfbX39dqHgu/hXDvtGX4zwUehNo4eUoeDuD4udChbDyhkkbNKO
	rMSayKp5CfJ/ob97T6k1otmA3LUuPkUFCR2/rHCUBdPp021VYatz2yEcfPjTUhjy1bwqwQ2qzO1
	LWeZqocM/Lsc1GeZNgNtALlXRdWyyVR4neF9yeeJfPDd1oh4nJrDem4K/4uV8tTU=
X-Gm-Gg: AYBFou0OXXmXwxRR+aSPHTk0/L3fv0/2HGDCwOUsBsnDLHfqyJV/7ko0x1YPyaAIVVs
	nL6euigm2GgC6KtMWNuYSx5bBmrdIzkMugoS43e1ljL35XuoVRPPojqwxXGfnEy6kGBD/07YH9d
	w6qzY3TdoC9y7Vg7Gi8WHIqMA1Q/hvlpck/U4NE1Crib4s2di8tGn4bpWTXPS08YiunsaKnAFNa
	OHi/xYlRe8bTlpjPCfmoUgOWObAovwpLsjNp5m9xz9eIzeZYvXDfZiTRUtvccq8uuWXEEfHyGEV
	mps1foAn54Cuv+6zbVD2/BvYjQJ44AuZXrcEqPrRBAp1gmsGOsYSjSILMoNI8LvXd6DyALTUvqn
	5mh6E8rs1jX27QIH2Wz4/i18/+y/FP9njc70Wq11Fi+GNAe2F6CK38sd+n1VN
X-Received: by 2002:a17:90b:17cd:b0:398:ba9e:75ff with SMTP id 98e67ed59e1d1-398ba9e7753mr23318491a91.21.1788234818742;
        Mon, 31 Aug 2026 20:53:38 -0700 (PDT)
X-Received: by 2002:a17:90b:17cd:b0:398:ba9e:75ff with SMTP id 98e67ed59e1d1-398ba9e7753mr23318450a91.21.1788234818326;
        Mon, 31 Aug 2026 20:53:38 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-32bdfd03e71sm16702035eec.1.2026.08.31.20.53.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 20:53:37 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH 0/2] clk: qcom: negcc-nord: Add the secondary QUSB2 PHY reset
Date: Tue,  1 Sep 2026 11:53:20 +0800
Message-ID: <20260901035322.654-1-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: wyfZ4HWiLZT0jHZEFTim8dsZBbT7Qlp6
X-Authority-Analysis: v=2.4 cv=G9Ms1dk5 c=1 sm=1 tr=0 ts=6a964c43 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=KtG9YyVjr6Sm7fKX5a0A:9
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: wyfZ4HWiLZT0jHZEFTim8dsZBbT7Qlp6
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDAzMSBTYWx0ZWRfX+k86bOUPq0hP
 AHdUO3714EjzM2b9ksSk7RDhIkbpLc9adaQpsV4cgo+pU80rzNkUSfo2Iag41aetZlVqhMG4Cyk
 jjlPTSM9w3wfnKbXtM+0z82sggg70CQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDAzMSBTYWx0ZWRfX7HaZXiCJ5hA5
 hyhrLLx5S6t7pKeoeEwl1GHhWDYlcm4F8mjcKA0xVy8ErH5ehKpH+XX+06Pn+3QWe0il7n8wug8
 I+fpWD8JhZxjkWkMI0qWBV0o6St224WGuCZ5xYRsnxUZppWASisKfjAA0r8oYiSz3qctx1FwE4N
 CIYxVkRmWTl406ZeXRG6/ztua80ITuC1CQYMI1tCn7r5el5wx8g9yotZxrI/GQTIkdjFnHDH6Pt
 dil9ismCpN+7/60fyPzLp4V/sPEZqi1A7IlSWB65LdsLT8PVOQS0Oy6eRDkyxQ2tAydJ83JOz5T
 P0eqxj8N9XRZS95evL2TQ7xjE723RV+6IJGWdFsNlVTdWI4KMftei6JzW1zut06CetjQHI1VX4z
 p6GXNtIIFiTKchGjVxZ5GpKN6oOF7G62U4eEfumy0cu/KnB23eR12I5CH4dU7ZP+FW22sFfLyDZ
 cPe3StbCP70kiDCPaWw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_01,2026-08-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 adultscore=0 phishscore=0 malwarescore=0
 impostorscore=0 spamscore=0 bulkscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609010031

The series adds the missing secondary QUSB2 PHY reset to negcc-nord
clock driver, so that usb_1_hsphy can be enabled properly on Nord
platform.

Bartosz Golaszewski (2):
  dt-bindings: clock: qcom: nord-negcc: Add the secondary QUSB2 PHY
    reset
  clk: qcom: negcc-nord: Add the secondary QUSB2 PHY reset

 drivers/clk/qcom/negcc-nord.c               | 1 +
 include/dt-bindings/clock/qcom,nord-negcc.h | 1 +
 2 files changed, 2 insertions(+)

-- 
2.43.0

