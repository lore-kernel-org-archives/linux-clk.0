Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34719347524
	for <linux-clk@vger.kernel.org>; Thu,  7 May 2026 07:08:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778137704; cv=none; b=l6qmniLMhnEx6ee9DkLJDSctYoTQcI8a9D6OCApWYOlkfTlDTib64V1rpTshJ5aTEtvSxHhfEb8GLMXuh0rdslGX1ogACTr5rHh3CPqNM2XPz1oJIpW3/0s1iGrQ6Su1OVHXy30ceZHG0MUkgfBiyUGRgXrfc0ZeKXE76Iy+bWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778137704; c=relaxed/simple;
	bh=4Ws36Kh4YBbC0ww0Jy+xw/tAJtFPBW16pQwGma9xSls=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=o8cY8CuKnGvDksrNorhDMA4ZukhzlKIZtf75gQ6VOqZ5JyvLIT//1NOhLVtm5Gx6MHmf/ZUD7daEDpCPwEg7cj5iH81EaqoI/WFmI0AI5TJ/217XynRsUxV8Oyhb+2T+TKUnRY9JYcZ+tShNB5VdJKEi+D7nGp0FDkpNMF5hiRY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=N45eEQEd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jdtfTSNW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="N45eEQEd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jdtfTSNW"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64746WaC880840
	for <linux-clk@vger.kernel.org>; Thu, 7 May 2026 07:08:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kb1gCwgaGV5H3d/jKwmfo6mOPiG1Fyfm04poCnOImZw=; b=N45eEQEdw9pIS0Z5
	eUD9RVMc0SyCILgyB6fbwC7ZrsGaFqryR5FkjWvSZnwXBYVq/MU+iB01GgdvT7Zd
	CCX6sy9vYjHvVT9UzeYXKoaXPZ9nqAJ0O3iI5UTV2kp+w95/BZ6k+AqYlZSfzYdo
	84pYPQgqpjJJuEjm0+b5nLvOiOdb5auu1FurC/goDLhu3StJLCu5aMeBUjEutX9r
	yv0gX5D3H+fiG6mSYOGPx/P/E16Re3yP5JK4hmx9K8p/pYtlFdO893yzCfo23xDX
	BNqgTDT08cemH5rw3H1wheiQJwcWRlHSJlrK+i4//SlPJ8VByam+r2FXTUnSks9B
	G5UyMw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0kdq0jn9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 07 May 2026 07:08:21 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51009190feeso10907511cf.2
        for <linux-clk@vger.kernel.org>; Thu, 07 May 2026 00:08:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778137701; x=1778742501; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kb1gCwgaGV5H3d/jKwmfo6mOPiG1Fyfm04poCnOImZw=;
        b=jdtfTSNWujwtlsFQ37PMZBiFjSxXsuN91b4dxj4Eopg4q83CQLePZnBNI+1Yp0iQ7E
         zRQZ1Ebw0ttHPuhpXDZQLE1vsucUgsnqqBOBO23FzIRkzeFCdtT6EBDAQy2CQozVAzq1
         hoicPER8peWzJV1rkoA6i61P3YjgjDixiOmy9n1k4AtydXfS/isjlGUREOJ78UdPR9vy
         dtLCAGqK5YBRku8YlF1TX2GEcp7Cs2Cj5LBhHUC2ACpD+2aUTnjA+p0Rx7cb3/Co0uNd
         xIlx8n9AfxyjySfU3+bt4ixs3PGFGgXWChIRwbmQ9Jw3rTLzdSCxz2gYo6FZytwZOq4Q
         tYhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778137701; x=1778742501;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=kb1gCwgaGV5H3d/jKwmfo6mOPiG1Fyfm04poCnOImZw=;
        b=VjGlpuZNeFP46tahveFtatugv9D98F/lzocCasNRzkbTwpuuf/F0HvmdcgAzPx1hcJ
         sKgBz8F3YW27FCwsAyx8c8M1VbmEc9wrKoJhItAMTzBR9dkGcBW3zj1S9wdzRUvfzxO1
         6Y9942kaJ5YSMZ/VAk29T1ZaqPkXXhSC/12cXT5qRCoR7hmyGqH2mpauly1f/Fut58z4
         iZQJkxSNHKpPPTpJTnWla02F6ytg9n8KpO4b3bSn2MM7Z9OhSkuSR/+rop8J1ewVLcd2
         j/k0W71MwxPNgHPzt4xwd1aGd7gSMnv/IFHdh+mNu+640IXzG+05IB4TAbpup2QNFdHL
         WFsg==
X-Forwarded-Encrypted: i=1; AFNElJ8lNVwgazRk09jazLlwFail1mpYMXl0DhSUtrMeX/6nLpyaZpjiEE51CzlxEXf4gZgH3aqDlEx2Bps=@vger.kernel.org
X-Gm-Message-State: AOJu0YwmbfQOU9kZwkLQk+XyYui/TdP5C3EUdNfn3sq3DGHnpsIFq9XJ
	M417h8xL/QlvrLy2AUjnVKnfa3KqfjI+xOEheGnzKkzHWuh4w52sstorh8mGD7Goze/P9PM9p8G
	UFsBRewwiO94IBWhqrf4fujinRzm/kOkEnDNs7ASJv4z4YrUzFWE9JVXCWold6nw=
X-Gm-Gg: AeBDietYBk26PoPgdF+y9gcPACNYpRBiSpbTJQIcX/u/3F/NHvC5X7FSSV7l3+wG+Km
	0w3JIPrAtcaSeEPMG8f0UUDLAHtIMZzrDr+p9evDiFiL/9CYWCJvgZNvwuUzzIDdWmLm/zL8hR1
	R9OJ+zhjedonFEFIckdfC2KQyVn3jNJignQEmEwlYcikDMX+nju6BMqSQ2kauJ38OaC66joHCaI
	07sw4/R+vqNCkNiYjQAPu8G6eriAO400zcWCzc/RbEZUvVoFGAH0+oOItmOXYJgdaUBblrxz/cp
	qg4Ax9wxk4T+9VZKUxtU3X3jKE6rLvloR9jykNpxPgSlNz3cKg6DQoaQziYAs+vhjvcrJipgfpD
	WQfKnjBfxUePuT4ioWyR5+icisLBK8/PvtuT/9BAj1jCp1Vym0eSewKLstY/GK8rzQPBNl1FKOg
	qNXNm9rT5Lc9u4Q08LTexhtJt2Hb1MgvYZC7jwR+PdL/ptfQ==
X-Received: by 2002:a05:622a:a13:b0:50d:8903:ae6e with SMTP id d75a77b69052e-51461be03e2mr99847091cf.5.1778137700702;
        Thu, 07 May 2026 00:08:20 -0700 (PDT)
X-Received: by 2002:a05:622a:a13:b0:50d:8903:ae6e with SMTP id d75a77b69052e-51461be03e2mr99846661cf.5.1778137700205;
        Thu, 07 May 2026 00:08:20 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a86aa338aesm4296784e87.43.2026.05.07.00.08.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 00:08:19 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 07 May 2026 10:08:09 +0300
Subject: [PATCH 1/4] clk: qcom: gcc-sm6115: Set HW_CTRL_TRIGGER for video
 GDSC
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260507-iris-sm6115-v1-1-0b082ad8eea8@oss.qualcomm.com>
References: <20260507-iris-sm6115-v1-0-0b082ad8eea8@oss.qualcomm.com>
In-Reply-To: <20260507-iris-sm6115-v1-0-0b082ad8eea8@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=712;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=4Ws36Kh4YBbC0ww0Jy+xw/tAJtFPBW16pQwGma9xSls=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBp/DpgMRbML8GFqypvwXYiYitpkAtVZv8+fXRXb
 Vd5Ftn04PeJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCafw6YAAKCRCLPIo+Aiko
 1a/iCACMJACnilb3n03uyLi6TaAfrxpc/UBFCt7wVt23e+9UMHZ2+vsiS8SpgAMdRbEl0l3X6Ej
 +yLxQc4j+o1QSqHLuMBViP31wuIwjf0i7zUG+ZUWLQ51uQwC9JIrZ2RdH9dpPFooFnhcu+1wwXH
 Hnuy0o+sxe8FAwecQpF+Np4OBLQ+/fZMgXa7zxjvNqxUFq8ht8qkbNpPhfQzEBfOzGqQI5yDAoP
 CpOehfpO21GfxTnHBgg3e8qVyXq876Z/p0eKkfvWq+nrS4O2qFSvtEnk8KLYxbWWu/2lYoZhoZF
 BI3zeLED3xsdSQF2tkd7OfkJ9gaqW/6bWUTuPodn1PDMj+J6
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=P6IKQCAu c=1 sm=1 tr=0 ts=69fc3a65 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=KOvF56qbc03BBMn0VcwA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: qqWiXT2sVvA-zm1ab-OUgt3Uf3_CuYrr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA3MDA2OCBTYWx0ZWRfX0Kt2PJ99ZgmC
 0zoxFJkIPTk8JVPEnGjzHpTzB9ryiAqbfQAQiazF4XHrNkZKDafEYtQ3UyD7lgXUJD0NL0TFVmJ
 HNfRLTH3hUsYRkt9+jeeBlOi0jxBtIRG+Qz+NMS1YXdUAru5DhsYQsliSRQAKIF3Rj+J+w2Ct/I
 34Lxb5Cc6zL3rj1EixoFbIuWax4SXTKhEzMe4GnAEFJghAmOP5bXWqUyzemEplo/bXP/x0sIGqq
 j9m5Kv3mhOKILDCqPQF3o1nboLmNc9u/9QodkuAPQ1ZHuaARHFIRlsDCH73U1BBnT+swVeW8Wtp
 yOnOJhYMf2OWUAHu/v5RxGuAg6isAL6drvTrtPyc7a/aZjonaL1eg3uQiQUsgrjWRw2ET9dACNQ
 qOhXKHF49B36ZOJzagT3m5poAH24yGk6ohD7GAkU5mYF0PQ+mB4bHb23Pq7FvLpU89pGwNJD/b8
 9I8AcRS2CxMmt2SX5Mw==
X-Proofpoint-GUID: qqWiXT2sVvA-zm1ab-OUgt3Uf3_CuYrr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-06_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 clxscore=1015 bulkscore=0 spamscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605070068

The venus video driver will uses dev_pm_genpd_set_hwmode() API to switch
the video GDSC to HW and SW control modes at runtime. This requires domain
to have the HW_CTRL_TRIGGER flag.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/clk/qcom/gcc-sm6115.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/qcom/gcc-sm6115.c b/drivers/clk/qcom/gcc-sm6115.c
index 4c3804701e24..c5251aff9886 100644
--- a/drivers/clk/qcom/gcc-sm6115.c
+++ b/drivers/clk/qcom/gcc-sm6115.c
@@ -3218,6 +3218,7 @@ static struct gdsc gcc_vcodec0_gdsc = {
 	.pd = {
 		.name = "gcc_vcodec0",
 	},
+	.flags = HW_CTRL_TRIGGER,
 	.pwrsts = PWRSTS_OFF_ON,
 };
 

-- 
2.47.3

