Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B9BC40DB3A
	for <linux-clk@vger.kernel.org>; Thu, 20 Aug 2026 10:08:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787220543; cv=none; b=lgEgrhUSSMvybaEooMwTibNM9VVzU+KmrSQqL6YpoP9nJqYwZHnWmxugnQCLMN/k2Peawf1sR8gPKokJOxvVDTUHdAd3yvE0XCm3Lde8r7SyHzIjVsjy689f91Nsaqp6X9eJF3jsGTnNT64nzbROeQi58nZeCSme/+iZgZPkw7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787220543; c=relaxed/simple;
	bh=TtqjP/pi/AK3r/5kUqubs2fndJh5LAqu7eapYk2jRW0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IdNyEWCcLnsG+dSOEcfavVolo4rjyMloVPJ0aFlO4rQyEKZ6lqImHFPBtJ5G98YHubAiCE0wwE429rb3FE+YVy2YspJCfkNILEB92nz2nmkDlq+2DzYD5nKk45rkiRBUbg2BMGg7qE91OvQrnUoSoax+X44YHrj/Zbn4VPcRgrQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dWaM7b2m; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kanBQb+B; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dWaM7b2m";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kanBQb+B"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67K6eYAu2161122
	for <linux-clk@vger.kernel.org>; Thu, 20 Aug 2026 10:08:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GevB+jEhNYhG9RjZjKoCOkGbasF5w2lMZxEjd1Q0qN8=; b=dWaM7b2m57B+26vZ
	Ot9vbcBhJz3KPu7bcfemaJmwK1nyXEfZWDbJ6MsBwolMfaX3TtaBSpac0BLjo4l3
	kOpODbaLCkROQ2tVzy42aGdIWKwB0KlZbyrEQ/D7c78Qhr4COnMi9HL2z5aYIBgO
	sVquDJ4idSbsw7DLBlwCBlhKM6MdEr+IZzlBYKp0wOy68FjPwx55FDbvGp7v6Fxm
	ldrCzVCwNb04Sir+nMQZ6780IbqZnIP4Y2MkvtB9PwGx6tZwjNFXFMTNEYfy3lG1
	uRtQqsW9UYutpfpB6EEA3rymQ1Ylu8vQ2uu1+rks1MxXu3MlZGPp6bb7NKS0lItG
	c+1R8w==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g5vh7rrvh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 20 Aug 2026 10:08:55 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-936e393061dso187736985a.2
        for <linux-clk@vger.kernel.org>; Thu, 20 Aug 2026 03:08:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787220535; x=1787825335; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GevB+jEhNYhG9RjZjKoCOkGbasF5w2lMZxEjd1Q0qN8=;
        b=kanBQb+B8CiLulpi9bzddhOnMAbUyeJcC+eeoyDfLA9YpyMggySWjN3xAfa2FQhmmx
         tKy8amuWdLpALhiqYLIHpWDWJ4clDS0x6WbntC99b+YexV/BhwPnGXP7oWNuHilx0mRX
         Y1N7/Cxib7MdPI00rXsSw9AvDHHv+mFZlnLovLgXgRNw0dqqJVUEBCOoTE8yzevbt3xy
         dncyzls0vTLsImfrv6QhXYuc2lVIU52ObzAJEjryMTh/wPoZT3OVU7PuINRd/LDOaeRW
         0loFaTdWbHvAqOqf/Dqu+b9+Nd3dgk0xKOVtCHHLzlKwPqERspftwMqX0kPBMHwxPKZ8
         QWTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787220535; x=1787825335;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GevB+jEhNYhG9RjZjKoCOkGbasF5w2lMZxEjd1Q0qN8=;
        b=sLd8cYazZ/ZCOzbHsqIqkgv89fqFwTr6VkyEiBIwdmL8xDNWoFdUL4Lqyh3YNPf2L8
         ZQT+ptYVLSiNaFqcfoy89TT1CPWZbSzPxA1rJX+4Hvi0c8lMpLaq/Z++qfcibxPYj+6c
         PoSeshp/iQfbJJEzAMjqAgj/N2zgY58uQ3tFvvfolEUZzX+4O2Myw2zNaBZVQcj8yemI
         bqcaTNMKZaLmeZXxkJWchciixWAtVVRh5T7AXc3TAaZNXxytPusw/C8EHY7xLZrFBsU9
         4t1XauDHHJPm2YPyzw4uhXNjj9NaxTmPAE45PcvOj9ZeX9mj1aywGrM9jdWK6Mfhk2uf
         H50A==
X-Forwarded-Encrypted: i=1; AHgh+RpJsEs2q/Vcpl0eipCvV+Gk3imrtJVToa4q+Fbewd2YOnuAFjxcGMBP5pmJdO/jArqW2KiWuf/pI6Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YzN4gXeEH4Ca4UKcBRtzwGVrErYmHmR83nuk7KwJemrtsuDY3pI
	9cCySkfP9tu0OkMS7vjlwBInM2mv0kO/74XS2XzJrurD8UnQecW4CZ0ymHY0Z8S3YsT531ghw3R
	01G6K+oXOhdwLZqXUolPeYsuE9Pt08gARI3sitVJstpeX1HO7yg6nsDtSVHsHSr8=
X-Gm-Gg: AR+sD11XBOKY/16ZN7EbgONFJSX5nTCYvtyY0oU42otGXngzaA/SE0f+UF4OxKKyRZ1
	tu9rjjleKQFNxrVWDLt2UdDgqheFl+M6EPRUzp+0pNBaFkNDPYtqWIVfuT3SjeYBgKUZFxcNDxk
	dSSY4QDe64KeNd75nrLxDdTzifwKLO6mtTPOy6wKBW8MwaMFntPp1WoK5jHEjEXDUaBqZHtjGCc
	hRhD97ul3O5wBdCXFHXMW2AwuArTLJAkjQ1eJZHlG15E3qsUlbxjCffaghxR/3GO+wggaLkgyjP
	43K6yO+FuJcrsHY9WN14B//JH8bvsGCvaJ7GphBK7DS+TmT9+j6PlzgMNx4RuKGhf5ipacrwsff
	iyiAOQDvi
X-Received: by 2002:a05:620a:444a:b0:92e:9cc7:fa46 with SMTP id af79cd13be357-9371e251dbemr991633385a.21.1787220534529;
        Thu, 20 Aug 2026 03:08:54 -0700 (PDT)
X-Received: by 2002:a05:620a:444a:b0:92e:9cc7:fa46 with SMTP id af79cd13be357-9371e251dbemr991627185a.21.1787220533986;
        Thu, 20 Aug 2026 03:08:53 -0700 (PDT)
Received: from [127.0.1.1] ([188.27.161.240])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499aa1755b2sm134966935e9.11.2026.08.20.03.08.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 03:08:52 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Thu, 20 Aug 2026 13:07:10 +0300
Subject: [PATCH v2 07/16] clk: qcom: gcc-kaanapali: Tie the CX power domain
 to controller
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260820-qcom-tie-cx-to-gcc-v2-7-e67ea30d8b7b@oss.qualcomm.com>
References: <20260820-qcom-tie-cx-to-gcc-v2-0-e67ea30d8b7b@oss.qualcomm.com>
In-Reply-To: <20260820-qcom-tie-cx-to-gcc-v2-0-e67ea30d8b7b@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tengfei Fan <tengfei.fan@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=863;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=TtqjP/pi/AK3r/5kUqubs2fndJh5LAqu7eapYk2jRW0=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqhtH12fZKjipypiquBel0oTJnLFr4rZYYXJ/6v
 ecX7PbBXRGJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaobR9QAKCRAbX0TJAJUV
 VkHpD/938RHJNyk1VPMNf8qFUDJhO2HuaaG+F5ecZ0p2XJsSVrBoRLc52ygG/fambwQTzCKnWo5
 9FcA/laS5COSEHZ17YSCzapvyrDflF7LLFu8i/Kc5xVyHy1T2jc2Q3SXIE92r4loXTKfotCrCqe
 WIiBF9ayyZYdl1A+nLSDIcij7B8+vTpJ0/Kdx845kjkR+WLQKxlOGbRCN4j93m+9rTC2XEXE9Y/
 VjJKAOHgwFlq4OfB0ml+GnDxrWJDndbMBe8tJldTe9LYruayBhuIoooRlg7C1Oarux94hPu2Xmw
 Zp9+4xN7sGa87WZ0GZAbcj4dDHMy2bVABGWM5SVnF0SZHcGzAMJkpMVhZP+ecQFGHbufuJ/eICp
 KsR1dpGHTQ49qP6u0WUfbapxZlUiwlK25Ruay6Or2eVWhnxAC+C13YO4cSPbVlMgZZ/LyLRREIl
 7rBI4NNybY/bTQ6HrmqS5xddKp70pNbGczINi0mmKp7iZRJdFypjr/+j5tsuMq6D7IcGe0ls62D
 UghUh0zT/IR35s5XPWNBQcx3XpymO+wXcq2GUo0/v9zrax0IsqvfcLPJYjAv/tLoXWdscMEnkjo
 Y6IwfXrSdkWgA4SPML5YraReS7yASXBYQOlkZEGDqx4BpkCpQdEr/pDbWKNqA5RaCvLSmF4+aBZ
 rkTc+AFYSLuhBGA==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIwMDA3NCBTYWx0ZWRfX0m/3QRSSnsBH
 0tGAAXIOunWk3BnT7ab1Lhy2DWwN5seuDgG5QvAEKw2/qGvK6DemZoDX/2NntDynlZyeSF7rdzp
 8/smQh+ZROVORqsw4Dwe0sZi1g7SHvJSrlSvDTPauBq7dad+SLaw9OEon610dTWdUUFrSgLN+ru
 +BVWCDfdbrFSesm8DNQH2wwh35k0SamydZp8EeSWKes7VJEsgm5R+/JnuNtVyStxkPd6E7QZwqb
 2kIoTBaXdTtlEEi43ZjdkHqiJnchYcnv/CTJWkE2FkM97GsbEh/eNAY11BQKp56wS3ff5arOzdb
 bQfk2xJyE+9ntt6qdSjupz0xlZMTYPkkl1XajjaXT9MVVnaA/Y/YnVz2hg0LYqTMYg53fStYh72
 Gbg9GaJfuwFnMrdCk8ffFzjPpc2I5XvnDzuaafo5XeAsNeR3yaYGL5aQck4ev83VKXShK9kxdvs
 gc04ht/bEv3ZW1EBgzg==
X-Proofpoint-ORIG-GUID: kt9R13ZAbMpyxJJl0G8W6ba7JuPz_ovt
X-Authority-Analysis: v=2.4 cv=Y7fIdBeN c=1 sm=1 tr=0 ts=6a86d237 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=wUpz7uCjLrEXi01cjX+DLw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=gcpHbPksm3HONcV3VD8A:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIwMDA3NCBTYWx0ZWRfX3kqCu3f2DI2h
 zdmg78iQgEvb7cAubtkNe/IwEg5I5Pa6KIzDYqyZL2w8mItvpx1FjFQFjcUeCURPL01b233P0vt
 HwD1nm3ucXBcbyeABS5M+dsxBPvpwns=
X-Proofpoint-GUID: kt9R13ZAbMpyxJJl0G8W6ba7JuPz_ovt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_06,2026-08-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 clxscore=1015 malwarescore=0 impostorscore=0
 lowpriorityscore=0 spamscore=0 adultscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608200074

Enable runtime PM for the controller, allowing CX to be powered down
once all GCC consumers have released their clocks and GDSCs.

Fixes: d1919c375f21 ("clk: qcom: Add support for Global clock controller on Kaanapali")
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/clk/qcom/gcc-kaanapali.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/qcom/gcc-kaanapali.c b/drivers/clk/qcom/gcc-kaanapali.c
index 5bcbcd178657..c40d2da1086a 100644
--- a/drivers/clk/qcom/gcc-kaanapali.c
+++ b/drivers/clk/qcom/gcc-kaanapali.c
@@ -3502,6 +3502,7 @@ static const struct qcom_cc_desc gcc_kaanapali_desc = {
 	.num_resets = ARRAY_SIZE(gcc_kaanapali_resets),
 	.gdscs = gcc_kaanapali_gdscs,
 	.num_gdscs = ARRAY_SIZE(gcc_kaanapali_gdscs),
+	.use_rpm = true,
 	.driver_data = &gcc_kaanapali_driver_data,
 };
 

-- 
2.54.0

