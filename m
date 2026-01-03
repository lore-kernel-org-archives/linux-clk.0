Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 993BF2512F5
	for <linux-clk@vger.kernel.org>; Sat,  3 Jan 2026 05:57:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767419844; cv=none; b=MSm6picwREFHaMqP7JojOCX7gboxNj61EYD76ZAyOHGPypIGsGJjqvYMqOqu7z3+93dTAKxSEB28C9BJygTAIphQ3l1Ztf0sqjWL/udA86kHvg6CKyUAPq7a5muVAQMHUMxB6tibdRfnFS7YuPL9yZHPL7qka9swTM4Nw66+11Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767419844; c=relaxed/simple;
	bh=zR0ZKamJhj8fPRJFjLx4SI1+LEepdyCvufaUK8H8Twc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=gNneWebi8bjBvqpJpUK32k27O30vf+RIsL2M8CXANvC1Sz6JD94ahCqO5wf89FQuQK4p/zitcA+wT8Tfvu9d54DPeG3SS+kHprrsa/x/qtnCkWiij/GP8rbVcImQuSK9/o9i2P6P1xsSP1PPveHx09Tb9DYurAy2tm5rderIqdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Kdj1pPX6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RDr5K8rW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Kdj1pPX6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RDr5K8rW"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6030Jo711555633
	for <linux-clk@vger.kernel.org>; Sat, 3 Jan 2026 05:57:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=/OG1VgE/jVbBxc/gh4mUXE
	U4V5VDa8HcFUCStq+l/RU=; b=Kdj1pPX62X2f06XZLl5w1OPmzuDpkV1YTzGBb5
	kIgjBIfWWjxdgEgDqbPb9S1AYzyvnwtkbhWUAfd3Z35HHBTL5vU8ITqd5Z8wOlYD
	KWB301zMbWUP0JiuKmOWjpg27cGa5IVlL5RR+rC0z6up6RsPSkhJp5vHUZKMe/rb
	s7QbsVgdbdolayuE1xVEhC1KnUPxvQylno9R5lX2ObmcgcUCQcAh0H0cMU0EwtbP
	9Y0Xp2/V1uYQHkAUoxb+2Yq4Ff9c5jMNYgl8WDOyzIi5jGp1m8ioPTANGzG/WB40
	LNSpxV/+3uZVFdMenyxuDneRpu7bgKCS5PZAq3AokRHFUQVA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4berfn8ce2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Sat, 03 Jan 2026 05:57:14 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-34c3501d784so13812221a91.1
        for <linux-clk@vger.kernel.org>; Fri, 02 Jan 2026 21:57:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767419833; x=1768024633; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/OG1VgE/jVbBxc/gh4mUXEU4V5VDa8HcFUCStq+l/RU=;
        b=RDr5K8rWKatg59ShtmNxIUYiXtUDM3l/wmTOHZKuWrhq+DfUmLMjqa72iAnFDBiNy3
         L8gFLI9mW7lFuApbcAhilyaD0I+pvskNEOrcBdheRR3BmhNCJhmqBDcjVrkZrm/Tu5D5
         82O7/A5Iwj3I8KGLseZOknzFPTlf58wmaxV4kjz5UvGpTDlhHZynU5waek3MpjcKaet8
         GTXfgRggSmnJRn0wFsG22sgxkUfu0MAzG6+D4PKddMFWLEgSSh5F0EBar7+HOWlFxdou
         DpnbJ9jxDnDnqW0BsAHYJH6ckrVHnr1R+kioWmmcE2rJ0hshqEM4U1DwBB9OA/W/RyxG
         RZPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767419833; x=1768024633;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/OG1VgE/jVbBxc/gh4mUXEU4V5VDa8HcFUCStq+l/RU=;
        b=cbcwJ8NCrGpV0R3O5blpYOCS5bk3S+NrZqCefLU+XQ5usebk5TzA6z8ZKizjdM5sIn
         QEFLXOY+Mj49XJm6Iup77zV7j/CLCCyn1Y2tKND4bdS3Dejd603tGwbaLo/RaV0FS9JV
         GwIheXBO3/q1iPmNSQ1+Ptr1tkzS2HqVReWfLIoRhG0GnkNspGmou7u4s6BdZ5F3yptJ
         Cp+mqfBO2kp1g6STYUMTi3CxMTl1wIZZZxru6zK7im2YZZfxfWqe0LLe3ptWC6r28Aal
         fzWvn3lu/CjTsqtkzWBeMZi79QfuoCUM4pgvttDlMdcKYvS02JynvGDT1TaJr/gXBnhS
         qj+Q==
X-Forwarded-Encrypted: i=1; AJvYcCU3GrT5adQZoy2Pfc0/4c/wwgtssbqhNtFruHSdHdv3K+0dwackUwGo3zw9vLRHR90mcALVvDLV5zk=@vger.kernel.org
X-Gm-Message-State: AOJu0YztPUgoe4qL/on84u4aTC22qc1KV2EcU+fDFb/CV+BQE6cRFroC
	Mtu53XAsSWTgmUveXaj7WO3i7ozVxS8MMzhXj9UflS6N+yj57k3HJFrMWRUZg3v1Fb2x+tWcXhd
	wGpzpDoKAHBA/nREBWVBVnTnnbgVW1hDTutiTtUdJy8UzfHtz1qgRs/8jLqET4kZmi5dGe+U=
X-Gm-Gg: AY/fxX57YWtw00Nit1ZBEQqbwMn8l3bXwi0xTxBNc71N7gw+B27rcFq54nPQ6g2GbNv
	9eHQBx1kZJLALiDFJunsBYQU5imsgCXkis2GBzv4QBLlPP0xLftClCnHLq6RypjmnIi4DG6CgBZ
	wls4/mlaDBO42TUWZim1yOjcxI/dqoEFVv5gOk90rH0Vm7X91vHSbJPt5z938eldHFb09H6rgYz
	cFKqzongAjgmWhsMeHalodGYu/Z7rRBDBbIN9QnEaQ7uHxxqIzHR7sUpTJyJ5xSgytJRzdgTYVe
	hvGpuTbYCL3N/pIQTqWeCL01BtzmW9fxzkTKTwQxBmhhaBLig3I1SX/kB1xxq7ADOZWTtXEp0Jk
	Mi7n7F84k8X0pwdvZ0WJC0zMMwtQCOyMPiQ==
X-Received: by 2002:a17:90b:518d:b0:343:7714:4caa with SMTP id 98e67ed59e1d1-34e9211c415mr35159638a91.3.1767419833345;
        Fri, 02 Jan 2026 21:57:13 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHBHOepO2cKQOdMz9KWWGshGlEkeLqd8ARIn1Z5OEkhgYEK7D/KnM+tOanIL358F26UTTzzzA==
X-Received: by 2002:a17:90b:518d:b0:343:7714:4caa with SMTP id 98e67ed59e1d1-34e9211c415mr35159627a91.3.1767419832873;
        Fri, 02 Jan 2026 21:57:12 -0800 (PST)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34f475f1726sm754760a91.4.2026.01.02.21.57.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Jan 2026 21:57:12 -0800 (PST)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Subject: [PATCH v2 0/3] Add missing UFS symbol 0/1 RX/TX clocks
Date: Sat, 03 Jan 2026 11:27:04 +0530
Message-Id: <20260103-ufs_symbol_clk-v2-0-51828cc76236@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALCvWGkC/3WMwQ6CMBAFf4Xs2ZJSS1FP/ochhJYiGynVrhAJ6
 b9buXt5ybxkZgOyAS3BJdsg2AUJ/ZRAHDIwQzvdLcMuMQguykIcOZt7amh12o+NGR/MKHXmUnS
 q1BaS9Ay2x88evNWJB6S3D+veX4rf+ze1FIwzWXVSaSENP1VXT5S/5nY03rk8DdQxxi/gH3ens
 wAAAA==
X-Change-ID: 20251230-ufs_symbol_clk-c669042d65be
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Pradeep P V K <pradeep.pragallapati@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-GUID: XEUwDa6OMebNE7fUpiDER5cUkZ93QAd1
X-Proofpoint-ORIG-GUID: XEUwDa6OMebNE7fUpiDER5cUkZ93QAd1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTAzMDA1MiBTYWx0ZWRfX3MtPTR/PRVPU
 bXfDEf5P9fKcUgGRL2MboIHpNJTFzuh311KI8YvA5H7wS0ioxo/Akf2Xk+3jO2T8MY+EMYYHPlf
 tr/NC/6ukM0arMvId15px5CcOWChw2woeGImWIBLhYnYSdaHkIV0yO7v3/v6j/lm1X0tZHHH89W
 /vBATKOuw9h4vNsqbdeTHyx32nvzRt6vAE7LTJnEGLxiVkNJ/eayctYU1z1pfDxD9Ch+PWbBa+N
 QPr+7PEdMIFk0sVbDLmjptbtn05fWiNxIkbqcqVQZMS/H/jU5u0pYH3NXHzO7DhV8YG8bMvSfHI
 chaE29RWN60IIxu22D0VE6oIfnTL8IKdJAhE7pw0DAVWrmiYRUJarvRt8EoPSspiqDYwg5UoDio
 Lb7Uz3eScQ7FZm2enOHqhBZGTzD3/EdRkdY/VQbItznQ999M/rNthDP09KK6dybsDp8DMSc2LNE
 N68iSVimc/RA3CTBRHA==
X-Authority-Analysis: v=2.4 cv=GNkF0+NK c=1 sm=1 tr=0 ts=6958afba cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=VRlZGQLi0vypEG6YspIA:9 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-02_04,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 malwarescore=0 clxscore=1015 lowpriorityscore=0
 phishscore=0 priorityscore=1501 impostorscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601030052

Some of the UFS symbol clock infrastructure has been left undescribed.
Add the required muxes in the global clock controller driver.

The UFS testcases have been verified with these clocks.

Changes in v2:
- Update the commit text to remove "Add indices for them to allow
  extending the driver." [Krzysztof]
- Remove unused parent maps and parent data from GCC file [Dmitry].
- Add RB-by for GCC [Abel]
- Add RB-by for device tree [Dmitry, Abel]
- Link to v1: https://lore.kernel.org/r/20251230-ufs_symbol_clk-v1-0-47d46b24c087@oss.qualcomm.com

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
Taniya Das (3):
      dt-bindings: clock: qcom,x1e80100-gcc: Add missing UFS mux clocks
      clk: qcom: gcc-x1e80100: Add missing UFS symbol mux clocks
      arm64: dts: qcom: hamoa: Extend the gcc input clock list

 .../bindings/clock/qcom,x1e80100-gcc.yaml          |  8 ++-
 arch/arm64/boot/dts/qcom/hamoa.dtsi                |  3 +
 drivers/clk/qcom/gcc-x1e80100.c                    | 72 +++++++++++++++++++++-
 include/dt-bindings/clock/qcom,x1e80100-gcc.h      |  3 +
 4 files changed, 82 insertions(+), 4 deletions(-)
---
base-commit: cc3aa43b44bdb43dfbac0fcb51c56594a11338a8
change-id: 20251230-ufs_symbol_clk-c669042d65be

Best regards,
-- 
Taniya Das <taniya.das@oss.qualcomm.com>

