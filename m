Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C91C82D948E
	for <linux-clk@vger.kernel.org>; Thu, 24 Jul 2025 13:42:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753364568; cv=none; b=aRiwJCjaazQCns8SD+v9yW84C+85ygXDNctFFknM51l1Uf9mrJ8k5Mw/3Zi7HbQ1i7ie3T4qWLUwRk3JARkMhAzyODCtE0ZapOY3sFu22/SbYqLaYjJVk0ATwda7zNUd1HxJzCfptjOdKglXuJLJAmUQEZS7oW5hfT+rF5QYxRU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753364568; c=relaxed/simple;
	bh=vGRgVTOfDssnsSqYnvBFvPNY1C/z3DVIT6+xrGICpvg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PUswIv7Uq01ZKFdVF3NJh5vf5Z3LcP3amhR5XYEc2UhYjjUiKKphBJw/iTc+3OaHZNLnUC3QLvVZgMKsyfZhiQnageA6XP/hWeSzlDyA7O4LFfmdqmwmiOazNNoWxKwynREyPMsuR3dH6wa75Z9U415sfwIjk3FA5n9WRGVVQjg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MSVN/Ph5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MSVN/Ph5"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56O9IMrj012645
	for <linux-clk@vger.kernel.org>; Thu, 24 Jul 2025 13:42:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=sZth73oB8B1
	222ELpFTANlY4LXWFy5IwxIszsgN5J0g=; b=MSVN/Ph5IOY2qxNn8k+r7kq5wVv
	XnVMNrIaGps/EdquNHpYCT/T48JSXcTAi9Z0gRik8oZ0orKowceMlaIWRUPIygfT
	5nvNrfIatRI+e2cdqnVX6kaHydHb17YqJ20e/0xjzzlwGsp7WGPCNWIypu+jaHJ1
	3As3wNLrH2C/IOzBQYSIcmTSroSuR15ELA53A3ZAvcWWhspx87ccvfKP8gM1VEin
	ja1lwe4J8iyKti+aYzdBWLiqqYRm62/Lxxw2zKCY4GA3Vga2P42fXiU2THfUI1Wy
	1T+ssj1gRPVbU2f/sX9PB49/TShLyXReWuMz9eA9CIYCOMOGbVQu23vL6mw==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 482d3hxw1a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 24 Jul 2025 13:42:45 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6fad9167e4cso24426426d6.1
        for <linux-clk@vger.kernel.org>; Thu, 24 Jul 2025 06:42:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753364554; x=1753969354;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sZth73oB8B1222ELpFTANlY4LXWFy5IwxIszsgN5J0g=;
        b=elTq6btZYZdPz3oRHz3ALRQoeRCK6QFb6mcpFyoxg9V/2b2v4nfoV40ma50COngNxa
         tmjSPyUkw/wfykm9SicxwCXLvfxYA3elIxQo4esa9T8R6K713edNquQkcN3YGc4SEfKm
         FRCEumGHDYAcGc0xwE5kjHxubd70RQII20rrWd1AexxmlWBJcpqVT/WPGeAj41TtPlWs
         HObzolD0Li4UMTrSiZWy9oeKVdFwWjDQHukuOgYPCw8YXrkHtgV2v2tdQKIBzr5tFoEh
         nk3qGZSD5FHOxkCrKShx/TmZMUf3cjrOYIlhwVpmOqq/DSXtZdzbuCfaaCpvtpNd4oAG
         7z5w==
X-Forwarded-Encrypted: i=1; AJvYcCVKrCW8euFOnMylW6LrnHbHZk+QeyElQq2AAcdmOgmjkW6hSIQz5h016ROjzNMlN3w+fhLjGr+iki8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwMMizk/8mpvJke8jhBydOm8WUDYz/kPino2rjY/brGvFg3HcQH
	DMQoRDqVEJDHrRc9NwovNyteYeNTVEp8YkCZmQnq0go1K8gzeIsama6XX5izBautxwVMi5Zu28S
	EZsMS7z7xRMt6/xsNsVGQxB/pqEEdwKBa0V+wTmXEnc2iItEj/Wu3ee5j4KChwwA=
X-Gm-Gg: ASbGnct1gYLvt5OfbC4f5DnqozdTB8M/loia6ZqcCbaNZfPQsWBPgdY9WmLhqPI86S+
	p9JJV+5/bPuwCi4MavHnW6oPAFUhKgEMti7ruJvQsX1Jtgn32yuHsb8O8F/RsSgy2xGFR4S2cMc
	jYb1+f6cZIV4xgyzOMAYHSM8Lk+qLRba6JYUKP9QzPiIZvczbUtU76yzMQNxM1DaQJLhSQNdq3F
	9EMoQlG/LfzHxrm76pq560wkqO1AbqeQ41S51kmmwy54UDO0bSx6GJgCY0Q7TvQnjeKxWYPJmfs
	w919HXCTxhkRRgu0QyhWysA/g+7lP5x6KZWKdbveejya7FdtTEuPvQ==
X-Received: by 2002:ad4:5ae5:0:b0:704:f7d8:703a with SMTP id 6a1803df08f44-707006e3bebmr113655066d6.46.1753364553682;
        Thu, 24 Jul 2025 06:42:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHGwZCs1ZXKsn8nvGRMR6iJSS+ZcmyQZ1l84AjZ3RmhPlugzRsIO+22IOdFC4rpCj3UyNAasA==
X-Received: by 2002:ad4:5ae5:0:b0:704:f7d8:703a with SMTP id 6a1803df08f44-707006e3bebmr113654516d6.46.1753364553099;
        Thu, 24 Jul 2025 06:42:33 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b76fc7885esm2228471f8f.35.2025.07.24.06.42.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Jul 2025 06:42:32 -0700 (PDT)
From: srinivas.kandagatla@oss.qualcomm.com
To: andersson@kernel.org, sboyd@kernel.org, broonie@kernel.org
Cc: mturquette@baylibre.com, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, srini@kernel.org, lgirdwood@gmail.com,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-sound@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v2 1/2] ASoC: dt-bindings: lpass-wsa: remove un-used include
Date: Thu, 24 Jul 2025 14:42:28 +0100
Message-ID: <20250724134229.103001-2-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250724134229.103001-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20250724134229.103001-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=G8UcE8k5 c=1 sm=1 tr=0 ts=68823855 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=ZRooaDHkeuqK4k2OZnkA:9
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI0MDEwNCBTYWx0ZWRfXzZFtvoF7BCJl
 1hZTKc1an0LUMKmUpYV3Fj6MRxvzGi8inYTjRVkl7ypWblHOqyPiFG+J9FCIyD8RAnrVsDB7caz
 gdyiaP2PsSJbiWeCaHaQhc75OmRdPrxRyfMRWmFgO3SKtJIbZFxIy1CzPCRni0ZYk0KMbqH3Krg
 hVBZWMNKMgSI1ZgcCrIgMmZg3760mHzc7ZzDdqL8gSxJ+ESUB0b33CbzeT9vVlmZa5iEQU+TcK5
 077H4Op2fce/HmNfybP2HqHMzDhagxXjB/CU160OMhcih84uTd2/dGXmvPSn4DBEg1lXwM909ab
 M42UkIauizPoKkOxHqKh+0Blgf9KQggE5QfNgcjngDwc2hHine44pPSnOM5BOWumR5aq4hCWUjg
 pVw3CYLLPEHV9Er6BrN7Xb2Hmuccn1RPoxra5BizRUhVgNx4tZSdQCdoSEMJvkLLk73Ng4Wm
X-Proofpoint-GUID: MIQMsBEq_NL-bgBUVbExeY5iF-n5_Nwm
X-Proofpoint-ORIG-GUID: MIQMsBEq_NL-bgBUVbExeY5iF-n5_Nwm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-24_02,2025-07-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 mlxscore=0 suspectscore=0 priorityscore=1501 clxscore=1015
 bulkscore=0 impostorscore=0 phishscore=0 spamscore=0 lowpriorityscore=0
 mlxlogscore=986 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507240104

From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>

qcom,sm8250-lpass-aoncc.h is really not used in the bindings, this patch
removes it, this also enables us to cleanup some of the dead code in
kernel.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 .../devicetree/bindings/sound/qcom,lpass-wsa-macro.yaml          | 1 -
 1 file changed, 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/sound/qcom,lpass-wsa-macro.yaml b/Documentation/devicetree/bindings/sound/qcom,lpass-wsa-macro.yaml
index 9082e363c709..00d9813d72bf 100644
--- a/Documentation/devicetree/bindings/sound/qcom,lpass-wsa-macro.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,lpass-wsa-macro.yaml
@@ -103,7 +103,6 @@ unevaluatedProperties: false
 
 examples:
   - |
-    #include <dt-bindings/clock/qcom,sm8250-lpass-aoncc.h>
     #include <dt-bindings/sound/qcom,q6afe.h>
     codec@3240000 {
       compatible = "qcom,sm8250-lpass-wsa-macro";
-- 
2.50.0

