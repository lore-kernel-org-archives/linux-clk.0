Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 833AA49B466
	for <linux-clk@vger.kernel.org>; Tue, 22 Sep 2026 18:45:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790102703; cv=none; b=mcSeiSpM56g3fdY9WfVkRNVERbg13ftScaZs3Apd44if2WsUI8R9UUSVNGnpOTEqIOmjczLztRnxbc3argpxNxf8qlKBpzmhWFrnER9aPevstsuI5ACsjv2Gpb3TGebd4HwEcIlR/zn0N7H2rYx64z7VeRkzolT2wBdlYM9Zp6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790102703; c=relaxed/simple;
	bh=beVjqaoP8TPHrm0UUdxAvZVYIgV0Hkxe0FspTEoaFKY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HibgXo8LXpN5nhwWgjQvwV6mX56Dh4DnIXkZDjGVk8ZhBotyRKqq7hXlpYrUvblQVWFosyRaJOM6G8v9SgnfozBmxB5zkVM/ishNH5YYX3YY3ZLZq+i2mTSUK6sd+t8Rm6Jh1Mo4TI6d2HxqbOHQLDFz4txMIex6S/PkUGSAeOE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=W/BEmNio; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=c+7LMEae; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="W/BEmNio";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="c+7LMEae"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68MI7CRP368025
	for <linux-clk@vger.kernel.org>; Tue, 22 Sep 2026 18:44:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=eVx2zn+6kCGTxEz1Q73Ti57VUd99JFhfmBV
	MS6c68iI=; b=W/BEmNioLHvZD0El63xaW8bKTT7nz1nHm28dGP0TayMiwkXymTJ
	Pw6aGzv+SVRid7WqkHVDaybMcvdvVlOnxRS6uljFiTywPoTfhbRK2/Z2ExnrRe2Z
	c33OT5ikZWne9HX8ia0rn/XoQqUWZfCBx9H8qzMPhJaL7mSkJE/ouOXbFUD8g/Sp
	SidmD8B65tfm5jnTa9eIxQhHOwu5ZYYfV+G1OttG8Z6KtVExaPnSukVSNZKifxH2
	LB9pPqRSJFFr2nqbuLlOvAFDVFIxgti55nySnzp44ZIyLYIPl5eKffQ97GZDGW8n
	Fxrul8zSze2TPfRA45nh7+Ev9FBebFnLj/A==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gurnta8k7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 22 Sep 2026 18:44:58 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5c847f0fe78so227303e0c.1
        for <linux-clk@vger.kernel.org>; Tue, 22 Sep 2026 11:44:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790102697; x=1790707497; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=eVx2zn+6kCGTxEz1Q73Ti57VUd99JFhfmBVMS6c68iI=;
        b=c+7LMEaezg7xW4RVKfj5kG2KTn9vxzuAqY1mvui7DA0aGoP6Q73wqQgrtsXY8B+718
         +EfBhk6hTtH+o6UkND6BnWxQmRPoJyyACodaoaasSc3NEYAtJBxzzr8nuw3t9XgMokQz
         MUzt2h5bgJtfz6Gg8RhCxtmT+KjBa63IYMqozdZOUSIqlGe618KSJaMJQug6hzFa3QCD
         Wx4ASYg7Ywdtx+JnC+k78ssGi+6pgEEBYHqgqEduvJDn1bZzYrdspl9pXIaKWZVLAtcc
         +FXqWSRjvLGzfJsKRUduQ3ffw0TjEbl4rYeb+NqKYEQiZbhPIrhaSpCX/mamnwY2qn+U
         yy5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790102697; x=1790707497;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eVx2zn+6kCGTxEz1Q73Ti57VUd99JFhfmBVMS6c68iI=;
        b=QvDcjBc4pIUuM5ZQBRQP/7e2agx06KFkvhUvldETdhjTHvZx9vpz3xT4g86Ms3290x
         pzjrpWzBIVe2tTwlSQXrfsuQmU/6OPNx8Y7CLdVXHellaO9Cx9FkvExHOn3tOSVPhzeC
         pMXO4wpHx/R3X140YgdASMEZ4v/j+dQETWbbhvF0yI10baEXDDymvug/eD9LfEnFy9h9
         RLO7f84MSFjx+gfjX5SMdDzW5u2t75xOppQ3m5ffrky6gfJSr5prbgEyACmESrbM/UE+
         iEFxkx26YuF5f0Fa2QVMQSvyw4FQAJxH1+GYeRaQ9uFSd6xq+qlUjWm2UiLTA3Qnc/VF
         VRog==
X-Forwarded-Encrypted: i=1; AKwUvBxjcvpShSXldxOQsaHM3rgcmu3+l8IHrvI7givO1elvUp7UwhRIM6+97prDS/fSsV3HI3HvHpXbvII=@vger.kernel.org
X-Gm-Message-State: AFuF++mIslPRLOgxLtaoM4pFLA19V118Zso7QOwsMeXd+PAAKhPKyook
	lf+JeHKB6QJpVr+Lg0+9ZWfARuc1meMNF3PYn3oN9HCNw2R5Pq0GO6iUL2WfDdk/OMMGw6VvpuK
	YElgBGRInDinjO/mJEc4zIsDYsbrXb0Lmw5+rPzf9bmAWtYYR3DrZZ9Xud3aee6A=
X-Gm-Gg: AYBFou0vtegWy9FMISwLVl8e6APKeb6f/CqDBPrVtFQUjjn8l6N2NnZIb1QvZU9tNSp
	easuwPUUOc+3hacjEE5W9GjzrwX+B0L4cCTLEf9zgCLYAK0qdLLPjHTQfKQES8Rs0qjAgO+pDsj
	swOfWLh4n+F1H/IaIBPjMOwYGtrWREudlwueeHXXVsuUJ6oinFFNZBodIB/z4iZn5MBqA0vuDYW
	At6qoc9YMlM2LCegtGFuyUgNxbdCYuQyWwA46Dah/79hp1oYWKlNOsTq4K7LZASLZJSsG3QeUh0
	qALQGxtu4X+NBCBJcrPVFd9F9YxZoQtIyXrSuFmN2kvNPVrB/xIeS48Xa0Mge035Ccv2l+JFuy+
	2mr2lWC+wFSnYX/6VOkxH+1WWyq5WFL8ploixb0I+1otUCuuMK4Lu/yQx3nUVbuQIk+KpgUpErD
	k=
X-Received: by 2002:a05:6123:5c5:10b0:5c9:a5b6:27b3 with SMTP id 71dfb90a1353d-5c9e3655d2fmr3477502e0c.16.1790102697625;
        Tue, 22 Sep 2026 11:44:57 -0700 (PDT)
X-Received: by 2002:a05:6123:5c5:10b0:5c9:a5b6:27b3 with SMTP id 71dfb90a1353d-5c9e3655d2fmr3477475e0c.16.1790102697195;
        Tue, 22 Sep 2026 11:44:57 -0700 (PDT)
Received: from debian (cust-west-par-46-193-35-178.cust.wifirst.net. [46.193.35.178])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4886876c500sm374681f8f.19.2026.09.22.11.44.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 11:44:56 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: Abel Vesa <abelvesa@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH 0/4] clk: qcom: Add LPASS clock/reset controllers for Glymur
Date: Tue, 22 Sep 2026 19:44:21 +0100
Message-ID: <20260922184425.56114-1-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: vp6J2vKNJmMHW1s-tZZwd-cwpED-upSu
X-Authority-Analysis: v=2.4 cv=eauo7LEH c=1 sm=1 tr=0 ts=6ab2ccaa cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=Hji71o54RgNgZYqDgtlrhw==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=68KCznAa1mAgJHz0fDQA:9
 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDI3NSBTYWx0ZWRfX9rVCxtKz96pa
 57UZ90SImKBxbK5edXysUkSmjar3oLU/y8NKzOIkCVxYN17uyGahvOZOSrfzCd+hoZHhqWaCA/Q
 xKDlyrL9GDqSvZ4K738bGqGnlqsGzwsEvEQlA/pWk+4b+GEheQL3i4vQBbO2NqC2PmkpX9+6Zjc
 eOsCcEhDVLmUJ/gyWpQKqeptYXieMKG0pBX6eVTAgIksRsZMEPUCUyYhx/d0Ti7pxtqXaQU6YKa
 yeaGibZJC5O/YKsFvKFURWTDJ//5hEsj0sZGq1rf61FVqPSAhNYXi6VBstiKxwM+YSnw1fSoJeO
 KRQLdRv2+KAvd+mIp0Nk6Ul8LuM1uKchJnA9U/GSvFxwnpom13Ds/B6+LjwAXCeR3czmwL+Baym
 u9yw/noib8hfIYbkKqP8eyOfKAFTF4+oOclRSSVjqX+RvnK8L6vEz2cm/LC9SRzMplpnQw5PkvJ
 30URO7VjIV+z/+/tqyw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDI3NSBTYWx0ZWRfX0TQgELTiifIf
 QlGSYSi40sYVn5oUEdyKT0+iiv40nRhrG1LDNYSoDfvMe1IY/ORjqbPSYzQ0LB6lNvdxHNVRQBK
 TQnBEBWFud53CbJnkCJVOknMRSzN6Ok=
X-Proofpoint-GUID: vp6J2vKNJmMHW1s-tZZwd-cwpED-upSu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015
 spamscore=0 malwarescore=0 bulkscore=0 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220275

Add DT bindings and clock-controller drivers for the two LPASS reset
providers on the Glymur SoC:

  - qcom,glymur-lpassaudiocc  (LPASS Audio CC CSR): RX + WSA1..WSA4
    SoundWire CGCR resets
  - qcom,glymur-lpasscc       (LPASS CC CSR):       TX SoundWire CGCR
    reset

Only resets are exposed for now; the Q6DSP owns LPASS clocks via the
Q6PRM service on the GPR rpmsg channel, matching the existing SC8280XP
pattern (commits a5c9c3ba243a, c2ef1ec97c1f).

The reset providers are required by the LPASS audio macros and the
SoundWire controller to come out of reset on Glymur.

Srinivas Kandagatla (4):
  dt-bindings: clock: Add LPASS AUDIOCC and reset controller for Glymur
  dt-bindings: clock: Add LPASSCC and reset controller for Glymur
  clk: qcom: Add lpass audio clock controller driver for Glymur
  clk: qcom: Add lpass clock controller driver for Glymur

 .../bindings/clock/qcom,glymur-lpasscc.yaml   | 60 ++++++++++++
 drivers/clk/qcom/Kconfig                      | 11 +++
 drivers/clk/qcom/Makefile                     |  1 +
 drivers/clk/qcom/lpasscc-glymur.c             | 91 +++++++++++++++++++
 .../dt-bindings/clock/qcom,glymur-lpasscc.h   | 19 ++++
 5 files changed, 182 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,glymur-lpasscc.yaml
 create mode 100644 drivers/clk/qcom/lpasscc-glymur.c
 create mode 100644 include/dt-bindings/clock/qcom,glymur-lpasscc.h

-- 
2.53.0

