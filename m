Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1A3A419FD2
	for <linux-clk@vger.kernel.org>; Mon, 24 Aug 2026 11:56:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787572587; cv=none; b=bABIlcFv3zeq4ziqw1GwIzVau2AKYfQ9rISwCaqDXpX7XDtotJbp17y/6FdbHBB07IY5/izleDDAvRVVNAqp0C5ylqZMYoEfhC4/mylJm/RPEQjh5dFejj/DJIlM60+WRiv2lABBmrk/3i5grpqIraqHBNs6IOIfNtpIzdt2ZDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787572587; c=relaxed/simple;
	bh=lQV0ldRNKcf/gqFd9CvCOCZHVi8E1tSUEkUVeUVD14c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HR9BChWKTiXEi5oTj0mSaeyr3sm4MwTIWpazolFnCsBxFYkqdwONRefOSqh6hoWbjNXo48XDrrhiUGsc39yM6DMlYp4vp1jVTnv2bQ/bjfgrYn9tNPLb/homoPhThFwzzvVOsq2ed5FhxX/meZusQYCB5VoOxkML2Z1hJHWh2oA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ICjDbyoq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=V3nogHI0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ICjDbyoq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="V3nogHI0"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67OBMZZ71673221
	for <linux-clk@vger.kernel.org>; Mon, 24 Aug 2026 11:56:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UmyJOOZgdqhPljjjMNEqZWEe3ZGHlmE2PquH4ZCuwe0=; b=ICjDbyoq+PDKm3Ul
	u1qUuuIIhRUbOLqKz2Tvkmk07VCNDJ9D1fv31MhiZqUm65TWn1O1v7Lrk76ABpQ9
	iPG7Rx3kzmfd/pgYe6uMWy1Bs0GJMaKvG/qU4xPgbOZhVN05aLa8O8yE9przpxMs
	udGYKtqUri+mefE0bfqRzqb5NbElLn9cFqLwcdcj2LB7FWzUC+3QQ+wyE/AP/EVa
	CnM47SZFh4A9ZQF1n9M6hu76UhMB9sEO9UL4pqE44dMNkPbGe9ceUf2Z+O8WBMpL
	WkD20siuC9/TyQsCz9SPtWvVZJpivdmvVgVNMipI3MJg6nq5cpb4D/HeyaujjBpy
	0SSzcw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g8huf11dg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 24 Aug 2026 11:56:24 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-526da7e3c9dso34755231cf.1
        for <linux-clk@vger.kernel.org>; Mon, 24 Aug 2026 04:56:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787572584; x=1788177384; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UmyJOOZgdqhPljjjMNEqZWEe3ZGHlmE2PquH4ZCuwe0=;
        b=V3nogHI0KBmubJ3vpA2shnUWDGPTu8/VLgC3zuMZaHTit0o2+6MpYeMHC2W9o7XfMp
         Ok4dJrek2CSjqFWcpBl7/dmbEc5g6taUf/cPemzBX4PRSn6TT+xskmIJmurTjImXnvh0
         K6CTXU0I1a4RKWOowJnyc4Mp3kZR95j6KfaWTY7EFFY4RNtvC3Jh9eZCX0tkg9lT1P6k
         OPi2wAhBAjfFj5bT6m5OzAthgDeBTFdOx6lxzsycLCpo2UDHqf6ErZuyoIyLY0F7O6SO
         nSi5oE1RSoP0nbZreNPgpQQyYQb6WCQW9+zhiXNCNa499Ot5s1bTtc3BA8Hr3PIca25R
         oZIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787572584; x=1788177384;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UmyJOOZgdqhPljjjMNEqZWEe3ZGHlmE2PquH4ZCuwe0=;
        b=Bnc8bB9MPC1HmBoBD5mT9BEDnJcFpFbxRTdTj7OPRGX7s2D2vXOuH2f/F2f/Zch2o/
         j2XmVz1c83pWc7NRPpmuWxpSzq+3aLIzv/bDaLpant3b6NGujtL4ZlJFBSTzXe+sd5L+
         RPTTfzcSWstlymZSkpA/ixtMX3UbYa06O69Y2/RE0RiiDcigo4tQjmbwQCOV9anwIARG
         Mae+rF6i8B68JNFWet7ZTG+BVoQxJx4q35x3Ajx5iyZZUNWMynmgkmNudSMs4OdbbCLN
         zp2uWc9M+E2j/YQOMcPIBAhmfWb1eP7EmXXv564aNhjyr1gq1fEShSZseumejpfsLkCO
         nv1w==
X-Forwarded-Encrypted: i=1; AHgh+RoNf6DtsvpljMTcUVidWM6Gk2VrzVYO15oTu8kRmmDKgfbc2PNKAGn49+zPi9LXiGNo1faig0Mj21A=@vger.kernel.org
X-Gm-Message-State: AFuF++lDbj9gFO/6RaRd45gSw+8Mjjpcj1cUdY4vh4E1xbSxRaHP8+8i
	oWcenr9XsKu/E8mmVgDR9cUCOw0dwgUwvqVEwE9KYucRcH+H1OJ+9TJtegp4ngIdOxU0tuHYg15
	6EIbPZqb/+l8NQSeGfVaNgjh0fk01liezHAq0/o14Amvqqg3v6fimmAOB1EVBKhk=
X-Gm-Gg: AR+sD11uLZjp8H1NdtY/54mbEIal8dvsbHb7GwbEBKWVxawZSVkFUNEsscXPjxdI+i4
	0TiaQqV41m3gdGIpj55oDXjMSdqddEJv+AGzZP8dSJCnS7Ab9SwN+W+eIMRuASCEz6wjLlrmEVZ
	dC5OENsUrr3mY+oVUR3LV28U1zlV9BXOJxlAFOnI0LR0a3zY7KKlCVXk+P8HmWvolvcips3sGcK
	yr2B1k2Cii3NDzzmmtW5wC4puQ36I7AqSOhQ192PEx+r3IG3DBigWGwmC6tH4Yuh2tWqiYCXIAA
	c7pEOAp6LHxmdJ/gYH6PoRJzvm0lYZ5y78RunVW4wnFjLw46cINdiwo2N3g+iaqwY2yex/lsxL4
	ACY5pMSdO
X-Received: by 2002:a05:622a:1c0c:b0:51c:a8:51cd with SMTP id d75a77b69052e-52e09b81035mr184452451cf.1.1787572583863;
        Mon, 24 Aug 2026 04:56:23 -0700 (PDT)
X-Received: by 2002:a05:622a:1c0c:b0:51c:a8:51cd with SMTP id d75a77b69052e-52e09b81035mr184452031cf.1.1787572583076;
        Mon, 24 Aug 2026 04:56:23 -0700 (PDT)
Received: from [127.0.1.1] ([188.27.161.240])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c249629563dsm1259990366b.17.2026.08.24.04.56.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 04:56:22 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Mon, 24 Aug 2026 14:54:21 +0300
Subject: [PATCH v3 34/47] arm64: dts: qcom: qdu1000: Add GCC CX power
 domain
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260824-qcom-tie-cx-to-gcc-v3-34-f1205a92682b@oss.qualcomm.com>
References: <20260824-qcom-tie-cx-to-gcc-v3-0-f1205a92682b@oss.qualcomm.com>
In-Reply-To: <20260824-qcom-tie-cx-to-gcc-v3-0-f1205a92682b@oss.qualcomm.com>
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
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=937;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=lQV0ldRNKcf/gqFd9CvCOCZHVi8E1tSUEkUVeUVD14c=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqjDD2BQ73yLRCFOKLr17yDz7Ay358Q5lphjkRs
 RfIqKaGiHeJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaoww9gAKCRAbX0TJAJUV
 VoQ4D/96nz5DGjGvRDpblSMlp5W2mZvvnSKZP5OmQm5j7yywF8xN+SpJp8JW/ZXc6YeuqQfHquS
 LLabqSdcs47NT7iT+GDSUwHCyLueq3gU6HxJCpdQq4Yy3hyYuuYvLtpgdiYKzi6kMLJTZm5QY/l
 GMU9DQui1JhEqho+3qh4X+3TJuLbqhJBZ/IXUJEUYkoTg620VYcCn95qrgBm9LNPjzSHVBR5LEe
 Hi2yEuWnNXO/tEBr/jfNqiJo/uGF/9SAQFwYrcerGS7mXFSoeBLeEIw6BUx2y10O+CN+pZz6Lv4
 SHbqeXxECCycOJbp7OKdMqqW/PQaDTtDNCaS04kh4d78NjZZyRN9yYZMMFZiumc1TJH06FBjdtG
 MKWlPM5dQToHTbAwh9XsTZtfHIE/kmXsYNo2RRL0awMVuf/eb5ZUUfZcgH6H5mKRmTyiiuMy813
 aWTETGmPvLtylomUIBFffp2UrltArb+5zkGYfjV71fujgsx2QsXYoGIk5FqpJSmgJ8bNXKnWORn
 DLYADf/Sbjb2mMO92N3dHjz8DDvKqiOepvvniFXBvVy2kyEWkFFZc5KyDUHIKDSnXSOWHLsmY1c
 g2NFMPFH37ZuvnWJK6bOfaRO/XB+euRRbga2c8t6jIQQOE33jr32fFLLZAf8P5a0Iy/hlwwHgGE
 TCb+lsJ1xjH8C7g==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDEwMCBTYWx0ZWRfX9ngMaLUD2o90
 nLgnLUlu37sUU5by7oUKYf3pyuYrnx4puqqS6CNslK4pst5TkP8FWksIqoPo0DwXkhFpyUj9vCp
 knEry7cK9tWcsqOkuT2kHSFS05IdO+s=
X-Authority-Analysis: v=2.4 cv=Wac8rUhX c=1 sm=1 tr=0 ts=6a8c3168 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=wUpz7uCjLrEXi01cjX+DLw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=frXxnpyXSSLf7P61oFUA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: CK2IIoyAljceKj7kQ0dY0gJrX4FCGsJp
X-Proofpoint-GUID: CK2IIoyAljceKj7kQ0dY0gJrX4FCGsJp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDEwMCBTYWx0ZWRfX7tHbrmkeDx0x
 CZRndG2apbQNivtwxapUKVASAHsydB+6x8/RU3GGxcXZwWHZFxkk4080s+RnABtwAYESMHuNlxF
 k+v/F7GBJIECMqn4DGz+5njpB2FYoZksAg0Ywf/1PZfgBomLJcmWGIqpY5XaIxV0ox8vMuhFbKt
 yg27Isrj8q8xzNOo6glhRoqFHWQeX+AL8Wl6Z8jyJZDzrmQGE7hpYa3zzRrjIKth+19JPsvLd2n
 CEDcuOePPNUFujMral7SVcOrHLNvvRYgCM2cNUQk6gDT3AWcbnFRQJzVh4dcmYrCyRcR1J4EVTz
 qt70rLqeW2H6Z8VGoQF1dNdCiQgs7B7faA7MS9vbGi60i5aYjKAuTucuox+OoVP1l6phHpi3M4D
 qeFSTmQ8s7Fi+d2zefa2SNoMVawRpbIrWVfA/USd4Yg3u6Wl+0jLlmS8AZwrlppToOKvVntsHNQ
 wvEmw6dRIH2oT6Bf6GA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_03,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 impostorscore=0 adultscore=0 priorityscore=1501
 bulkscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608240100

The GCC GDSCs on QDU1000 are backed by the RPMh CX power domain. Without
describing that parent domain, consumers of GCC-provided GDSCs can enable
their local domain without causing the required CX vote to be held.

Add the CX power-domain reference to the GCC node so votes from GCC GDSC
consumers can propagate to RPMh CX.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/qdu1000.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/qdu1000.dtsi b/arch/arm64/boot/dts/qcom/qdu1000.dtsi
index af106aebd30d..accb4b989655 100644
--- a/arch/arm64/boot/dts/qcom/qdu1000.dtsi
+++ b/arch/arm64/boot/dts/qcom/qdu1000.dtsi
@@ -396,6 +396,7 @@ gcc: clock-controller@80000 {
 			#clock-cells = <1>;
 			#reset-cells = <1>;
 			#power-domain-cells = <1>;
+			power-domains = <&rpmhpd QDU1000_CX>;
 		};
 
 		ecpricc: clock-controller@280000 {

-- 
2.54.0

