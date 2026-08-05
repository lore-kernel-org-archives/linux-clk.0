Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 498A844E664
	for <linux-clk@vger.kernel.org>; Wed,  5 Aug 2026 13:42:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785937328; cv=none; b=hGCuDoHIT3lrtlfkFhxbDZ5TiQ8M0sDx5BzQGX3qiHxUXY1s5iq9LQYrg75GKigrX7Yq/vGsYmoIMEqm7D/zlLnWW8h6JDQFhRRPNUx+kHU5LiQC1ng3grktxVysZxHpGrGwYw3qeinzaQ7D3VgV739hvglkbnM86j/YHqAMawY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785937328; c=relaxed/simple;
	bh=hvJ3Os+S2rmTQ3etCGO9FFdUReZsyLVdsxChBr5MVlM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NFUP4sxnf8oXYhJXdsWc40artO3+8GfPto1Btu2noUQp1pWYuJmGwsJTefpwO9wbnaYSnQXoDbPAQXrZ0J7WY70tCeSAik/JyHAYK7l0CDXotu10nrmiZK7+9Qb8WT/3QeI4Naoke9uOG0WP8HMX351aFvJJwsws86Pnz4CkMMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SeMhmsPl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HwSlnMKH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SeMhmsPl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HwSlnMKH"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 675BvBhk2164930
	for <linux-clk@vger.kernel.org>; Wed, 5 Aug 2026 13:42:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=QGZ6cVzjYD1blhwp59ff9yPA
	j+yBCEUxvcvUKqMHV24=; b=SeMhmsPlBef8oJZc4zxXQn3r7QrYTU/pwj1MqsQj
	MCpO2jYD2rSd9WYrN6TGYtXghDRU42bINTwbo1b13k2QBEOGc8Cdig7QN2ATOkUr
	IYdDwZs2NvahzywT03bqqFlqjFNiqD9GF6Rj1E/8NgLhJ5D38lj8ySkLURrtAnd2
	iKorZJ+2KQZsUhMPPjh6GohtqY+4wOrS3uBViiSBUUcGgNwcNeknnq3zZb4vOscO
	tLqRKrua88cCmmLd6lJSV2ClKTWncap4sEm8Q5jEGUxVtghvjBSh2qRBTXwRQChN
	WJZLK0c+ZMOkfU4LsiTjWfoF9+udp8DdjmgZEOy4SV5vvQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fuwbqtdgn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 05 Aug 2026 13:42:06 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8fc6b670b4bso11206876d6.1
        for <linux-clk@vger.kernel.org>; Wed, 05 Aug 2026 06:42:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785937326; x=1786542126; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QGZ6cVzjYD1blhwp59ff9yPAj+yBCEUxvcvUKqMHV24=;
        b=HwSlnMKHTWZHfItPdsmOdlPJj9+IWqdhOmdLJGET3EfkKOE9gzpGyRJ/m4DoaE37ox
         U4YlLaGHUCx2PsJsbPKbOMdmtE6sb2YShW8fvOmOjFHi5WZ82QlVZHUZpASL53gE671L
         9jklsKX4Png3i48t15ok4Nbiloai3MYkn5wZP2Yh+8Jtvc8Ddp7N+h0q0J9ZhtmgWO4g
         aqY8IUKdNUmQnurYfkXe5f9bHTyZLLi54Do1qC13bdNczkluhhCrb3No1bJJ033a7GpV
         xLX+3VIE3vaXTP/LORKIJC9wiN2QKEL657gZFfJYbXZEKUVWSRqJMbLwkQL9khvz8aGO
         6gwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785937326; x=1786542126;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QGZ6cVzjYD1blhwp59ff9yPAj+yBCEUxvcvUKqMHV24=;
        b=pxr5fIk/nLtNjn+qfDkqaQIgMc9SHQdk0L1EzweiXDXKEj2b1WArMXM4C3Og5Zj9hv
         Lt6fVa44t6ky3XPDCxbT7ApRqWi1LT1tWfKz08mYv7GKg24OnCIrsHzg1tOtRBw84DYR
         7R8LxKEGmRlCWLvlceeqgFqghcjFLWIsDzT1uIz6bFkluYhH58PrU8bkUIifzA177eWF
         oeVbVPcq7D9AU2IGRZPqhREo8ktW6UzpiQLTqA6P1mwasoL9ef71TrM8BnJQh9n/A1Zu
         BpgZeLH/mBbt8WyuC5Z+GFw9D6qdh3z0p4YnreSoUglNWe98EtojaDaoLcbA8cLD1ZOh
         AsKg==
X-Forwarded-Encrypted: i=1; AHgh+RpQMBsfrrRq+XB8PEIIcTAeAaJMgcOiYS5s/6ZVofbNuKUtoscZQnTHZU8MNsU1FABMm8AoB593P4s=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxn+Fbs8n7vBKwu8yY3mvxd9RkYQn06WGZoZc/Mb6BFzRDt9sC5
	gVgSht6zsnvFPNhuzGeBzFdO0EvhOlwNt7SNmZSDuawd63hm8nFKBI00TsGcF4d5pBCiL4Q+oJb
	ZcATSCbCjHWBqxjxJ5Sp+ehm5BGl5vRu+aKsmXUt1qgXos/kaIcKUzvtvcKLDt74=
X-Gm-Gg: AR+sD11LBywxlTt2yDrRmr8KzOtgtOOBGlQNgg2xS+iaHHnN90GxQ4n/4MJaRXveJx6
	4FdNcnRChKambMwhvJfJKRXgE1ThnX+L2+ptz6GTLLk72itd7qJdMtZvYkVuefB8YbKsIn0oQWE
	5p3GwgFIgK/3VXCXT3vnGuLQl7GXHr5HhPn0vd39M32JeYm0KytFl0SP3ltJQANvsCkp6rKhCgR
	s6fdwNIDv9q3uW1t42WS1cTEfgtTT91WgBdaB3cv3NHvCEvWqvOu+xznFpEmnEjAg1IqzbvOcWj
	HJAaEPqwrYyp1WYdZipqjcDm0vzbqkwFXGMvNnPb3cgbiklv+1JH6rxpY8vO1KZDkPlmYwz7ndp
	W5kmv24cQ1TI+fg==
X-Received: by 2002:a05:622a:60a:b0:52c:e0bf:dd79 with SMTP id d75a77b69052e-52ce5f7f999mr67814431cf.16.1785937325056;
        Wed, 05 Aug 2026 06:42:05 -0700 (PDT)
X-Received: by 2002:a05:622a:60a:b0:52c:e0bf:dd79 with SMTP id d75a77b69052e-52ce5f7f999mr67813741cf.16.1785937324345;
        Wed, 05 Aug 2026 06:42:04 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.37.248])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2036422825sm117379166b.43.2026.08.05.06.42.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 06:42:03 -0700 (PDT)
Date: Wed, 5 Aug 2026 16:42:00 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v9 03/10] arm64: dts: qcom: milos: Add power-domains for
 camcc and videocc
Message-ID: <dftvxtkdz6bnsnu3urcargv3saf3vi7iyaab4uaso4g662ddes@qi3ufx6wweya>
References: <20260804-eliza-mm-cc-v9-v9-0-39067760dc3c@oss.qualcomm.com>
 <20260804-eliza-mm-cc-v9-v9-3-39067760dc3c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260804-eliza-mm-cc-v9-v9-3-39067760dc3c@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: IZDSs8q6jPfTzHmPu1J-U00ke5t1z_ug
X-Authority-Analysis: v=2.4 cv=B+uJFutM c=1 sm=1 tr=0 ts=6a733dae cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=Afnz6uBANMlDQL2PJxecKw==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=vyOKmKYE018VkNFVGwIA:9 a=CjuIK1q_8ugA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-GUID: IZDSs8q6jPfTzHmPu1J-U00ke5t1z_ug
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA1MDExMSBTYWx0ZWRfXxbqYFmVT5048
 ecQjQB8u6Rp7JqWTcP8RNJR29cjfo79lWgs8623ghbjDfn59ODNE4siiJX7/PD0aesi0Mj8fswk
 0UW6HQ6fbII6FSapAjQxWwBinGdEiqc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA1MDExMSBTYWx0ZWRfX7DpSdmYCECH5
 LBYoKQx5Kd21QRTzX31ty7Rm1yGxwmSdjFPw1dSvXdCtLyWJsjbBo31DJi1c/EYBPxKwlln4LDV
 7TAPBAGHTy5a+H/WbkAhobUFZJWC+fJy4cR5/6C7ETh53ijN7ZCeeGyjd9Aqdg8lNwPgNcO/qId
 47xlkKnhtLRDRieLBDUqhUkkugBePwD2n4RIvuv0WdXDIczR5jdCE0WnWwiMIDfOMZWFO7KORxd
 1jbgCGj63+7qzYeR+/WspCGuvhG+9ouz2CM1+lm4gpbPSqT/9EZ0mhWo61hSiXSTLP80pOPG8/S
 x4zFK9J5iX+E0ZSyCWxqg+7z1azEoQYt3Q+saTUaQ3jiuEPc07KiKh8qK971QqyGHhrEkTNXyEu
 nmkdzBqB9kehBtNVHtHalmViP8P5658rdvvPNbhCb0WijT8a8PFIgfE08jwDZIupHDCTvEfzfRS
 GrmeiXm0DM84Bar8oGg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-05_04,2026-08-04_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 lowpriorityscore=0 bulkscore=0 phishscore=0
 priorityscore=1501 suspectscore=0 malwarescore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608050111

On 26-08-04 23:20:16, Taniya Das wrote:
> The Milos camera and video clock controllers operate on the CX and MX
> power rails, and require these power domains along with their
> associated performance state votes to be specified for accessing the
> clock controller and its GDSC. Add the 'power-domains' and
> 'required-opps' properties to the camcc and videocc nodes.
> 
> Fixes: d9d59d105f98 ("arm64: dts: qcom: Add initial Milos dtsi")
> Reviewed-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
