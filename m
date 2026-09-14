Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 871D347ACFA
	for <linux-clk@vger.kernel.org>; Mon, 14 Sep 2026 12:48:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789390107; cv=none; b=bc5ew4rVZgyTJWvE9qjj+/J4+NUxHvGeLaLBl+bxpepstZJS46t2pdSLQ+NJ74fqT6diJZNrd9sSRb/dKHQrzHnu73DGWm89dipMzptyw7dYlac1d73tgypgNet2hpSDQWnfohVTmFXRBe6IS+UAKW6ZevqXsZpVmHubNQKJhPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789390107; c=relaxed/simple;
	bh=dze4wvhywaa4IGtfhRrxf5rKmL75jkRNLTy2LSMyXVo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gUIMEQHU8ofugghc21uNC7lxNvaXunTHfv3B4VMPpjQqBX5y5/64G246P9nEdvGNFEWus/Sn63Dmhh1htkrBNYfb3kNz3T3JemEL+XRVUmp4pGt2I6/prnFO8bXuoA2DFMnTd7y5ry2PnQElLwLvIjvSDxMb7CFnQpyCigTfu5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hx0yl0eK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Wu85Xxla; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hx0yl0eK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Wu85Xxla"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68EBRFHC406691
	for <linux-clk@vger.kernel.org>; Mon, 14 Sep 2026 12:48:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cIBGGv4zoDGnQicFjFqWB9jWkF/JUKvJfkEhZDWYZPw=; b=hx0yl0eKNz/LnEcg
	8CgV+Rw0JrbT6ETNCgR+GqMZAg/6rFYuadlyrmDI23VT8FADLTojDa7rbXoFmJDV
	L/7IjrhtxD1Pg073b9KVo9TgogxAeRFcvWzHaOa6Sid1sbE52blv2fDXAfGDG2I0
	Nnc7L4YOoe/H+opVG8JpzYcZ95CeHdtzV27JFINoTP82DXb6upEMhdbdDqU4PsC0
	I2YBFga8RL5bwHHpaXI6HmHwjH3bKJ/6Tv2keKgxeHAd48B/qWGwwFLeEzzEdg/s
	YPsgSzLZ7sRiUIFX3xoJ0R/PMgxsV6k1DXAKEVNJ/FhtTX+ri1NSi9JR2wRmZZpB
	zTEnJA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpg2kr877-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 14 Sep 2026 12:48:24 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-939f3426a7cso557281185a.0
        for <linux-clk@vger.kernel.org>; Mon, 14 Sep 2026 05:48:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789390104; x=1789994904; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cIBGGv4zoDGnQicFjFqWB9jWkF/JUKvJfkEhZDWYZPw=;
        b=Wu85XxlaDJ8G6ORbifr31/I3e/A/vI0bxI9uKZwG1LQy512KcPh0FsLc22saGNOPcS
         Eq9Or5t7yY4R7gpvgQYmbMJyKHWRwPSGLYAeOwfUCp4H8Cr0tH3Pfy7onUn83eIR0O0g
         rnBCXheEpv2ZA7wYME+ieQhM5duj/FNHWfJ8Y0TKBZcMr7qUhBCT9090KoIcU4QaJP6n
         P3xbgCnqS3/MD3bHJj9fDrunSfWhm9FCyh4XgOAsHbhS/CB3Et8z5dujHT+PX6nDUw5G
         TlqauUrRvKRzFR3rbBq3q4kwyR6AfcdcDEBjOtkkZUtAH+TEPdlXNtbnzYV9YemxNPaf
         KRcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789390104; x=1789994904;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cIBGGv4zoDGnQicFjFqWB9jWkF/JUKvJfkEhZDWYZPw=;
        b=MkTWAowkUfHEhNd8b3OXW0oPzSnvcbDs56F9puZtvLMvjMlQ9mSPpVncTMKryoGEG9
         YBWlq5DgY4o6oAm34VotSQupK4COXTs2AuId5gEnAzGTsYfn2boW3yo3efCqUYhXK+3w
         bNJgwYPYAzSg3Vhj86QHmgAkMlf1bMVmR//H9ZqzFRj+Aoa9l05zHOfbRsph8BBrah+G
         LAtqv0KgPY5Lj0MJ+mOp0aAucahXAQOUeZk1fNTnIBXJbsxV1Rj1ycxY+RTZaB+XyrX2
         BRae8P8S0Hah2gjubaR7ze/nrBF/+9mYYQMVGTptp6wND0AoVIAIDhb4fwim+VkqLCPC
         XfCA==
X-Forwarded-Encrypted: i=1; AKwUvByECcF3mRrdNXTlFLP1ZmVJEoeozFohOQkfcQb4o2DT3rBYvKsvKT47QxzbnXDq+kkT6/8VajDnI3E=@vger.kernel.org
X-Gm-Message-State: AFuF++lz6HC0Fcsuch0kMouAwi+MwBZThhuRTgZ/muAb4Ts01K6Y1TRw
	kMOPisbsOwni35G6zGdcjW68S8lEVZYYKA0OTE9To0mWrWWkxXRAn+jFoOAknYOccBvVJEQe7gP
	0lHyH88sEaSa6ItcPxYHF6mXYVDwNCqVnki5qBD28PiokkwYBRrDBbG5m/TM820A=
X-Gm-Gg: AYBFou2o7MVnpwwfe5O80n8l/nhDjXAoqvbfSprNYR+UM+t5bHJIulz/izDOwIDYSLt
	G1paLbAJcSO5GMGyvrgC1Zih7ndon/HfO5BvgWRakfNlghRsWd1/56oCI4pqgh+54UmPwKEa6ik
	JGPsNiOLh3LeXY+T3E2NXuUW3oHX4ED6S9a5R5SQ35JXI42rq3oAAJ62NH5Y+9VMOv97rvkkQlQ
	O2iq1B/9aWNxjzHxAfxXlNkgUpPOoRaGMIa4WCbRGv7cD64r8kLmE692JY70C+7sqnwuDx25sWm
	vxIPZ/U97llT6CbXeEfGlkKuem8r1MJfaK55MV3GKywbHUehSsAszmPZkTQTHZUG4JnF7aovxcW
	ppQqNZaeO
X-Received: by 2002:a05:620a:40d5:b0:939:b099:d52f with SMTP id af79cd13be357-93a298780famr338260285a.20.1789390103595;
        Mon, 14 Sep 2026 05:48:23 -0700 (PDT)
X-Received: by 2002:a05:620a:40d5:b0:939:b099:d52f with SMTP id af79cd13be357-93a298780famr338252385a.20.1789390102937;
        Mon, 14 Sep 2026 05:48:22 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e6c566bdbsm242387555e9.11.2026.09.14.05.48.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 05:48:21 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 15:47:07 +0300
Subject: [PATCH v4 08/52] dt-bindings: clock: qcom: sm8650-gcc: Add CX
 power domain
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-qcom-tie-cx-to-gcc-v4-8-9d5a606ada33@oss.qualcomm.com>
References: <20260914-qcom-tie-cx-to-gcc-v4-0-9d5a606ada33@oss.qualcomm.com>
In-Reply-To: <20260914-qcom-tie-cx-to-gcc-v4-0-9d5a606ada33@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Ajit Pandey <quic_ajipan@quicinc.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Tengfei Fan <tengfei.fan@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=1724;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=dze4wvhywaa4IGtfhRrxf5rKmL75jkRNLTy2LSMyXVo=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqp+zTMciOruaNVKn91mmwF2+OZNrU2wwXHwBzq
 Qq//0VH5DaJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaqfs0wAKCRAbX0TJAJUV
 VnXMD/9pmlZONNfKsS2PAQuuQEMp7vz0n1m0joBCnZksElJElfjl9JyQxWZzQUjO8FXI05RtIwc
 bRpN0dxXjIPPsx3/8IAfVC1dJTr6vxHF32gV7qqGQ1n2urwJoSw5lOQunTfByNhhVlE0RrjgZfL
 BCsAk2fV8oxdbBc0thj2fuCrpxFg2zSXHNcWvquR8qLAh+WBwd6DbzyxdqyW4MqIB7zUOmj0vYn
 qOdrZK4r2Z4DVyi4TpXktQz/ijKnS3EgFSXcZUBCnpYekSb3n7ck9F5XLwO7GjxZapRY56T82XE
 TB0JE8m1nLER3B+a5h6PDbQC1UY0Q5eCLZU3SU5KJrduzWHHTuV3yPYJsE//mWZlf3vONWn62OR
 +vmzH+//Z3plBeKqMorlXQ25MqnBfMjeQp1lKyX8nSK6zhnkkj/MhfQU/EQf/SttZWr+xN68/Gf
 lKKfweLJHKffzbCH3vOrHcJFAOghvANHMj7KuxE6wqauHFwg3xoW/k5ZZsPOxhjIhaq/lH0tSPB
 44O0R1hZajtqIJnjZJUL5PUc8ak0ntXDiZRK4Bjeuu0QH7e/Ddh6GBhlkJZEEuiuKvIdHx5LL6p
 MqEE7vvM+Y59DTZmSHARjLRx0pv/JCk+cl2qk1l+DPcP6hwLCEQEYFFGvPOhNttmWNAy+c4BCOk
 5U6xkISQIGfUxNw==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-ORIG-GUID: EglUIyeAr9py2W5ZbsV9fGXERexDKRGZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDE4MiBTYWx0ZWRfXzCSBr3cgtKC2
 SnCJItyr3TlNgLa8ewtT+zKS9LJgyUqBpenRsJTA5uXfK/Tguk1G0fksdR+K8eGOqyKcexhxwGq
 a9tsFHuktXc1peMFeoTfb4k78AndeuWi6CpiLbXoeco5TJrEiZ9nTXEb0U5JLFTxzirpxjFc7nt
 s+eV+CfMATKu+kkXKw82gY9YjNXjf+3/15JqOogff+0iOnpRpaBiAb9qdtKdMKzi2Pngn2ctu1b
 DZQcwcLXEIp1DgdMOwQgtbnKUCijY+oNpG5/grL7SIfTZc8ElMVgqwmeDezj8qBm2BVXkOLhQYj
 x2rVqqI8t5vWTU6cFpe00p3HNWKsGm2YpPVVz1ip8w/3fbfu7z0cI9Fpv9l69l7hpy9QTK5hEp1
 p4TXfn3tui2LvXI8NKqoeEJqdZ53BVwxUDjyphESnaQ2goTor1u9nsgkfHAmOkPH6FoQuMv3OVm
 4vBkedwQWjQrVuKBHxw==
X-Proofpoint-GUID: EglUIyeAr9py2W5ZbsV9fGXERexDKRGZ
X-Authority-Analysis: v=2.4 cv=M7TYuCws c=1 sm=1 tr=0 ts=6aa7ed18 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=z35zQ5kvS4wbvuCDxioA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDE4MiBTYWx0ZWRfXzD0hZcuI4qBF
 A4b+TSLTX2L7sPCg/cppodkZCqj1fv8NbZeJElMAzDrLnThaqE3gWkB5qNnEMR88PjaRCtKn9cS
 XUJxWsnwKM1fwsO/varDsibnZOI3qTU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 bulkscore=0 impostorscore=0 suspectscore=0
 malwarescore=0 adultscore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140182

The GDSCs provided by the SM8650 GCC are supplied by the RPMh CX power
domain. Model that parent domain in the GCC binding so the provider can
describe the dependency in devicetree.

Add a single CX power-domain entry to the binding and make it required.
Without this dependency, GCC GDSC consumers cannot vote for CX and RPMh may
undervolt it.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/clock/qcom,sm8650-gcc.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8650-gcc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8650-gcc.yaml
index c7143e2abc80..543105b277d5 100644
--- a/Documentation/devicetree/bindings/clock/qcom,sm8650-gcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,sm8650-gcc.yaml
@@ -32,9 +32,14 @@ properties:
       - description: UFS Phy Tx symbol 0 clock source
       - description: USB3 Phy wrapper pipe clock source
 
+  power-domains:
+    items:
+      - description: CX power domain
+
 required:
   - compatible
   - clocks
+  - power-domains
   - '#power-domain-cells'
 
 allOf:
@@ -45,6 +50,7 @@ unevaluatedProperties: false
 examples:
   - |
     #include <dt-bindings/clock/qcom,rpmh.h>
+    #include <dt-bindings/power/qcom,rpmhpd.h>
     clock-controller@100000 {
       compatible = "qcom,sm8650-gcc";
       reg = <0x00100000 0x001f4200>;
@@ -58,6 +64,7 @@ examples:
                <&ufs_mem_phy 1>,
                <&ufs_mem_phy 2>,
                <&usb_1_qmpphy>;
+      power-domains = <&rpmhpd RPMHPD_CX>;
       #clock-cells = <1>;
       #reset-cells = <1>;
       #power-domain-cells = <1>;

-- 
2.54.0

