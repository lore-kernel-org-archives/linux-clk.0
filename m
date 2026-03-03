Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5854123ABBD
	for <linux-clk@vger.kernel.org>; Tue,  3 Mar 2026 13:34:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772544865; cv=none; b=Zp8nw4ql/d0c1p6hfkY22CPB/RZ9n4KcbiVoD6cUKiGkTMOCAPHmwjHV1tXQ13KUjClXij2O5OoraxagGv2/VJHHPVmg3hMHr4JRlQoaeMbLuHN3sXBYXmHpvPo15JAqqW5otYk3AQvAdTqLLGP4NtjS7Bpk5QmJ1Ec5oBRanm0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772544865; c=relaxed/simple;
	bh=SlNjouqKABxmzV7WrTdzdHU7fSvlJK4meO4sv93jZN8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TmpN9qPUZsQtW+11JSB3j/WL8EQVhF86WR0OylfGn5JwTTKAwuEWIBCMAym2SnDDJoeHiNCphjXt7Y3nHN7Iq4QuHCpmxOjcsLCyHTypIGkncDGzM9ZZBDO2BGPh1R2c+ok+34k4K94vFJZS0SwC0+0crUNRL3smdBZy0aRMnqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Vc9YYhxE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hcSJWwsU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Vc9YYhxE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hcSJWwsU"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6239mqpM3995479
	for <linux-clk@vger.kernel.org>; Tue, 3 Mar 2026 13:34:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ZvBZuE/XomQed/AjItL2PQEs
	Qsxd6Eu+axmB+v0qgY8=; b=Vc9YYhxEI+/K6tqRydAuO1pvhLc5jZyVVVHR+VZX
	JwB9HcGOTXVHuKqG9xBkFXzpSCYSd+i9BMFclJyNaq+yz7TPJx8ApGkE/N8kBuco
	jwa05q02gCv2OlUcFwoleaXvo1s/QMlEkXVlClXAaP6Du+kpZkpJocjqlOChd+kR
	L3MZ5kT8F/4Gd/qKq0xOEaTQDBPXDv0x5k4rwXfDRoyw6Yb2Wb5Jy0yztqXpTRmk
	CtgwDRoAE3tKolli42uAQ8dTWyOAFZbOaz2E3tw/m/Obu9TOgBe7tPxeVopiI1l9
	FSZMgfEXweq0NPGmMYGuj3X8nNqwSm0Ii8jEAa0Hy1HaAg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cns5fsks7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 03 Mar 2026 13:34:23 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50341fddb89so439825221cf.3
        for <linux-clk@vger.kernel.org>; Tue, 03 Mar 2026 05:34:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772544862; x=1773149662; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZvBZuE/XomQed/AjItL2PQEsQsxd6Eu+axmB+v0qgY8=;
        b=hcSJWwsUzW7bvjkMVi5cIyWFluqEdPXRBiC/y9TgOHsNSMw4w7xeBgS635yDW5LHuZ
         aRGwPouV74IDYhVZNuxkt+ZtT5krRV1Bc4J62qfZc75/3V28/3QXoisBK/lnhoc7Xb5V
         OUKJA8rHnDWbPGtOqQfmGO1TBUSKJ6yeFa76q8YgEU23qQaVThMO+8CXD5tAYRtRZ6Gz
         JbgMBoSZV/UKEzhGZqudh9XCoFqkVFgw/Vly7SjOf8VOaX4pN3pwA4P/t3287c3YCYyE
         FbswSei4pydGEhBlyLtJsPH5P1B+8RyKAIbLh+eL9/bR1iRAHnWxAcdNeCXunA58OiMD
         DvsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772544862; x=1773149662;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZvBZuE/XomQed/AjItL2PQEsQsxd6Eu+axmB+v0qgY8=;
        b=wqUwvAnhVhsINTK7BFDDP7nN5n52T/uAkKY0Sz49GsWO80FPDKMJwyWU0GWVsu6YAd
         rqn/ofGqlJ3Vz5CxI4CDdzZnBGUtG5iVPk3jMR7tQ0v0gbp4QY//jUCFgCZ+NQWioKgM
         JQd18M+JOxnp8Y2u6TJdkGmNremX1R4TCigZOlYhnanQBbMlpnxR1r1RHdKoeVaMjTX+
         idzoZao1pEoXTeZnG0Jd0TNT3tbXwMXsFZsqgcwh1P6BDwGzNkMVLrWcNFQrDZTwFAIy
         +xu02KjCfaykNeFT6V2Y4WWymENUsZISsPS02n5C5yFgmuNlqQ1DQGVcvMzRNafDOEzf
         rHtw==
X-Forwarded-Encrypted: i=1; AJvYcCVqc+Oxygx+LrTepro8J29C6dkPpL6kMmaND5ZUyLtr8InLIvIZ3DVKx/5p47qblRNvnO5qVaL1URg=@vger.kernel.org
X-Gm-Message-State: AOJu0YzIlFUfH+i7YIKN3X9hMOBGih+IylXCx5k/VX4bGbusC8XelR3T
	ovS4fzE+wR5hvAUC/yEARk+ytU8GErgsbyUnBvFsNtq5Hrag3YGIGoFPDWD/Djwv6YC8VXTKn2Q
	jTfjDKtqvn43EmQI+uhJuIcTQtUpePOnhpMBEWvcmP79FgXjMOKsP/u3A06Qp+0g=
X-Gm-Gg: ATEYQzzUt/F1NfPS72J/QqLYt6diA1LAui73yEgu1yMZrxvuNdssJdH4rVs+MAVjyeB
	g11gw2ncq7izFOVC3jd2GLYFNBID4xHIdUU572eLFRoRd63/QhiaySKkAtO4dgY/g1tLHNL1mKu
	D1A6Cn22EOUsBaRO127S4JttqNHho37MG3tFH8CdPvED+unztIq2pFIJxC4kdC3JmH8AwjiWjkx
	EBZRB7vmTz8btzGbz9pXDEE7blmojCLbt6zy9TPtnFYEQTIxdBj6WzuWSP7H+JPmZBYVL8y88cv
	/Apw+n1j4ZKjADDgHDshajdO6i1slh85LUcMGum6x+KOyfOup81H29uSt2fA7r2SqeFUuX+agJs
	tL31299rA66bi59e2yH/oyjaQYs0ZCYBkx6mr
X-Received: by 2002:a05:620a:254d:b0:8c7:1a83:a15a with SMTP id af79cd13be357-8cbc8e01d8bmr1868266885a.59.1772544862413;
        Tue, 03 Mar 2026 05:34:22 -0800 (PST)
X-Received: by 2002:a05:620a:254d:b0:8c7:1a83:a15a with SMTP id af79cd13be357-8cbc8e01d8bmr1868262385a.59.1772544861845;
        Tue, 03 Mar 2026 05:34:21 -0800 (PST)
Received: from oss.qualcomm.com ([86.121.162.109])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439b59723fesm16078037f8f.38.2026.03.03.05.34.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2026 05:34:21 -0800 (PST)
Date: Tue, 3 Mar 2026 15:34:19 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v4 2/3] clk: qcom: Add a driver for SM8750 GPU clocks
Message-ID: <dnfxxncwfh3jerlxhlbhssv64dfiyyf4ohpoxf2nym4pqxkxml@bptjbzorm3d3>
References: <20260303-gpucc_sm8750_v2-v4-0-2f28562db7c9@oss.qualcomm.com>
 <20260303-gpucc_sm8750_v2-v4-2-2f28562db7c9@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260303-gpucc_sm8750_v2-v4-2-2f28562db7c9@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=Pv2ergM3 c=1 sm=1 tr=0 ts=69a6e35f cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=oauzzCmhM186DRC0Y2yWPg==:17
 a=kj9zAlcOel0A:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=-momvpiiut8LGs_r7JQA:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: OXi9-YYlLAqurIpUkoPVnIrLdv3BW_O3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAzMDEwNyBTYWx0ZWRfX9sbT/KZKx2ij
 JodwTKVtFu0E3yyrD+G6gn1GQgFGuSUTlVQs1Rmyh/dOBAyBIqzT+CX6piC8MOTuW0EFmu1FrBI
 BDPYuWOQT8Sa1+1AAkSVLeb8iWeS6nF/8i/AunI+uiinttM0iRbMMUWPJBrjA7AtWtGdwJT6RyE
 U+u8weKuhh7K0M9kWN0R8YfmQMGsKX5etKoARMTdcvvDZMmLIBD5LyKQzFHdM6tMYvbnwfExF/E
 UMmjuGH00NMYZSykBnrlPcIWSQyE6u4bbDMr1uimwjytlM6o7qj04mPlsT/ulGj8do4OEwzqSJx
 mwzqhb5RUDMi+9pK+G+TQwJSoqFebWnHiM7mw2dTYiOJmZmlUYmqZzIXtKQQEj47mcaMxrsvzTb
 1z9Lly8/sg39ilxrbachoKG/eeOvTJpAQKTf5CRzpOvUuShC8J3n8qz0ebjEBs0J3SB2wHj8Hms
 eQCpq7IfGgwndotmYlA==
X-Proofpoint-GUID: OXi9-YYlLAqurIpUkoPVnIrLdv3BW_O3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_05,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 impostorscore=0 malwarescore=0 spamscore=0
 suspectscore=0 adultscore=0 priorityscore=1501 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603030107

On 26-03-03 15:05:26, Taniya Das wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Support the graphics clock controller for SM8750 for Graphics SW
> driver to use the clocks. GXCLKCTL (Graphics GX Clock Controller) is a
> block dedicated to managing clocks for the GPU subsystem on GX power
> domain. The GX clock controller driver manages only the GX GDSC and the
> rest of the resources of the controller are managed by the firmware.
> 
> Update the compatible for Graphics GX Clock Controller for SM8750 as the
> GX clock controller is a reuse of the Kaanapali driver.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Co-developed-by: Taniya Das <taniya.das@oss.qualcomm.com>
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
