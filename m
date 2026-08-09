Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E3A43AE6FC
	for <linux-clk@vger.kernel.org>; Sun,  9 Aug 2026 07:28:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786260538; cv=none; b=jt6CgK+b+XRQI3Ooj2smB4Ezv9oyheH6o6F1jVKQQuYsLf4IspU7LdPDA/lApxeQfreTVwmhHc6lbGH0KaDC7txDEd1AV4WFGnbRKbgIo3Bdd5ZqCmJkmJ16RyFUdfdecucfLEtjaeH5MaEJT7zlIjm2httasHsOR+T0emjTOEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786260538; c=relaxed/simple;
	bh=ShbJdNxhiNfmZPnf6dsWYJ3gqd5GdF+vBe7gD57oqk8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=S/jir+JDLcIsjlMX5qrGoO7z4kRpnMS9salTnu+yXoOAeptl2pnsRzGd8yTUD+CjJRyYjIj3S80tJg5Emoe0fk8N6hVzy79pyfU/SZR2Zxv1U9611DJRzY7O++AF2TiBC6IaWV32KJgNfAjW+jxKFl/Tx7Q6aGjnCVeOl8uQNgc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Jk3VwGr3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dRO/I3iG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Jk3VwGr3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dRO/I3iG"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6795e8Ai1598528
	for <linux-clk@vger.kernel.org>; Sun, 9 Aug 2026 07:28:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FrHlfrJLtBq+FFJ7bu/RFJZvxXsDP/iyySW2sKS0mxE=; b=Jk3VwGr3nGTH08+/
	U1p8fKfQVXapKn0laMwC5+8/iWD2luACkl81mMyi9Z5C/DRULYQlLyOZJcKfkT0d
	ncKDesKx0PmXrd40jXTEW4PoZAKMLTNO7aYD0fltsG1CEw6zGj6EpUmaVZo6n8d6
	JUNfk4HCVi1uVEo9Jeo+4z4deBhvbaGrTAX/8gRJ/JynEr1ASTCFqVfdo3ZNRoQf
	rju7eVi8TBjPRPnXM4n5eaO0DdbJksBqsoD8RT0oiiS1vlQseUR/f5iW3udVHuM6
	w+HayEuuUygjpO6IopeOG/9TAdK+7zvQDsVJtN3SMLH/1OS8RnmLBLdil52dCbkd
	Yl7TQg==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fww7ctdhv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Sun, 09 Aug 2026 07:28:55 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cb733fc5024so1416244a12.2
        for <linux-clk@vger.kernel.org>; Sun, 09 Aug 2026 00:28:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786260535; x=1786865335; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FrHlfrJLtBq+FFJ7bu/RFJZvxXsDP/iyySW2sKS0mxE=;
        b=dRO/I3iGgfMgQb54n9xIIQpgPdWBcXGfX2J9di2WA5r6qYzgUsPsCXvjSRD2HQV3NV
         LCIptUsoasq6+ki4pptWc3UPU33tTFTdXuvX3mMR1gpemIW/K6U1iigutpZDSDQFnsJi
         JYhUDCjTNZrn6Cht0DNgLmpEjWUp19fhkFw3Cg4jhTCfLg796BdOIFERcdqnquuB3vWW
         AoCGOENMKTLfrOGnlB8ydN2cg1H64Vphau+UAABjXYH7pCOTCiF1Q8f31BQaVE0Gt0PV
         M7RW5ZAHrF77R9GG9KhoZMbQhQK4vA7UmOcCdU2NhVHIqB6W9FJyy60bxmeFnTIiB6Ei
         nZbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786260535; x=1786865335;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FrHlfrJLtBq+FFJ7bu/RFJZvxXsDP/iyySW2sKS0mxE=;
        b=LKA0DzmKm0xQLvpIf/oyUKnKogvWzUWegRdmcPfQx3sLBc20B5k+D51i+KUqFZBHiO
         Qz2PBzCRtQ65Tvxs0OXYKyTc4o73GcY0RdYPPtFbKd5dEzCnTDjtpdQt4C2EZUDhoAKX
         J7rEIGpHF19r0Z5Zmh/o4iHuAVSUktxvtuoz89L9FWQtU9KpSwtgZJqY4p++4nPwbKTX
         cc5KnmYGw/jF8mMxbZgt+uF6T9ZvmRI/bHKUx2yFqbEQOwPs5vJXvzsq+9EJ7CF7UeM/
         w7GubVM+Y6Tc+WBKCOu9NZkUAm97rZJODJ3ugIo9OpamhO7F4QCvqD47WTwh0d8PeYlO
         0DyA==
X-Forwarded-Encrypted: i=1; AHgh+RqKHLTI3FtM0Vc6tifs0p7Wl4vrZ81ea8d0pHJbb359zKUbffAH+fw+/7Lf5cg/SQ5MQhby6509X4I=@vger.kernel.org
X-Gm-Message-State: AOJu0YzF7Yr2oIOHKbiMgCWlZQLyrgbbul4fgMOP/sQ9FCHjrEo4ImID
	2+ybU1OVmnQ425aevFZ19lnLyQTJcpCpgd53koLJVr1MOHmBpQHrAWnIu0ep86Idr4LDzQyTkVl
	ioAHdEZvVVwNdmhRxyfHwDtq6MO7n6cWnwL5exq/EKLO950CdLNxBTe3GcxTvpq0=
X-Gm-Gg: AR+sD10lfsVpTyOdjk15JIcsw7i/e40MOtmQsNmCp/4fgxpgIZmDeiGmWc43sapyYmp
	EoYI87016ArtxdNj+QNzM/X8VXfxIxkaQhOYs1+2Z/B1+uHRNO8fbx8s44eiaJdjPS/ckkUcX9e
	Z/5TU9kziGk4IRPaTjckzHwnQ57eTqEN/XIe016jpEwshaJmoI7BpBBiiXJEUcS1BHFAl97Oonr
	q6eG2k+I236RKSiwmZPAtkksfJqhHOrE1kSY5YuTTLRUEJjNyCwk50XrP4HW+xnBbmT+hRcOd9o
	gblQcJhexuqrDDbBu4Q1T5NjpZbI031vBLgEdMFgxM5oTRBfUnUuRv9izkfEYqBacr163MZxhjy
	dcdNiRcGcK2EkoGVy/c8sBkSz5ZSUVNRnZ8lfzUFXs8+7i+RgPkgMCvHFS62fmXulWG2kW3ygDy
	Cq7H2tMY+lSUFDOzvdRZXpa/E=
X-Received: by 2002:a05:6a21:6e0c:b0:3bf:c223:4640 with SMTP id adf61e73a8af0-3cb85f4e199mr42895290637.32.1786260535414;
        Sun, 09 Aug 2026 00:28:55 -0700 (PDT)
X-Received: by 2002:a05:6a21:6e0c:b0:3bf:c223:4640 with SMTP id adf61e73a8af0-3cb85f4e199mr42895245637.32.1786260534996;
        Sun, 09 Aug 2026 00:28:54 -0700 (PDT)
Received: from hu-hardshar-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141019b4eabsm22655630c88.6.2026.08.09.00.28.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Aug 2026 00:28:54 -0700 (PDT)
From: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
Date: Sun, 09 Aug 2026 12:57:11 +0530
Subject: [PATCH 12/15] dt-bindings: interrupt-controller: qcom,pdc: Add
 Kuno compatible string
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260809-kuno-soc-support-v1-12-5e0ede4a0c72@oss.qualcomm.com>
References: <20260809-kuno-soc-support-v1-0-5e0ede4a0c72@oss.qualcomm.com>
In-Reply-To: <20260809-kuno-soc-support-v1-0-5e0ede4a0c72@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Taniya Das <quic_tdas@quicinc.com>, Georgi Djakov <djakov@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Radu Rendec <radu@rendec.net>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
        Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786260433; l=852;
 i=hardeep.sharma@oss.qualcomm.com; s=20260204; h=from:subject:message-id;
 bh=ShbJdNxhiNfmZPnf6dsWYJ3gqd5GdF+vBe7gD57oqk8=;
 b=NoKi1AYhyMh+IWtxrB6CA2rbeCilVTa7VjKp5WtbRISlpAzsbKIvFCfssQH8P7Uk7V1LquaaU
 sewzTOI1lhhDmzpGbxJYXNhj9Ps5z4O6OQQthjxUD7FpsW+8LUJfmMO
X-Developer-Key: i=hardeep.sharma@oss.qualcomm.com; a=ed25519;
 pk=IvwPDKA2xr6jWaCIBBY2ran/H0124QUzVfun+CtEikM=
X-Proofpoint-GUID: 6BfczS95CZmAu_653UFlEX_l_MwZIoX6
X-Proofpoint-ORIG-GUID: 6BfczS95CZmAu_653UFlEX_l_MwZIoX6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA5MDA2MyBTYWx0ZWRfXwkZKpRAV6s81
 UVx35v3vUHL/NZlGKocH8CT47q68ADOrbJUBib/gSy/96tizWBQM7nbJs8I0/svENVghLmCc4nP
 nQV/pih8xsMljjwrdVSt7xZLczvPY19br+PMj+dlak0vHakHUeRxGN6F24LxRo6YQyaH8OgtURf
 HOESTK6XAFCD4+KsBHzBM9VOcGs2VdwSqtdhbGro1dxv0SBLmGOAlIQwY4AhNdsC0nO+qRWetyj
 oOI2Lwl9IYWxtiYH6AehPkQ6Pqmbf+ff24rSNgURpS/DbWyYANJ5Bt2xHNieUTdOtBJ4m0SMweS
 oyMk7pM1xnW3vLgDLTbY4KojNUiJO217K6dhm3ZWMT4BE0pBXBkotN/Obp3Nh0dSxPgwzIYEJvi
 bmER0cfZNB5wDdzTid+Z/4t9S3IumydSDTTci5+wK3oNzyhIVldKRsviEq7iU2BN7UbDn8mP7hI
 ZyFVj8HMYQq6XKCE23g==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA5MDA2MyBTYWx0ZWRfX6puQZlFO1fUd
 VcxVg0nT+PPS8mWrn+R6Pr2b3AO75fAXPX+5v/zlxiHz6o7UC4WIP5SmrT7PLRegwpz0OY10rpw
 9Sm8/00Z3ZAwq7cKqCJKnqCMLvhxqIU=
X-Authority-Analysis: v=2.4 cv=IPsyzAvG c=1 sm=1 tr=0 ts=6a782c38 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=E7BvvrGlrPUR2SlizuIA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-09_02,2026-08-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 bulkscore=0 impostorscore=0 adultscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608090063

Document the Power Domain Controller found on the Qualcomm Kuno SoC.

Signed-off-by: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml b/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml
index 8162a49d49a6..518fbf6b2761 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml
@@ -30,6 +30,7 @@ properties:
           - qcom,glymur-pdc
           - qcom,hawi-pdc
           - qcom,kaanapali-pdc
+          - qcom,kuno-pdc
           - qcom,maili-pdc
           - qcom,milos-pdc
           - qcom,nord-pdc

-- 
2.43.0

