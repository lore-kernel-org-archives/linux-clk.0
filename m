Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D05962F39B8
	for <linux-clk@vger.kernel.org>; Thu, 10 Sep 2026 07:27:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789025264; cv=none; b=Py5I9bzCi7UqvixkJNZ5HXYTvNYIJs2LRBPq27oNosAs9PLmEYPV4OQu4Aiavef4IgXqy17AQtDj797hVLIaT7NGPDPk+oWOBbxdGRfkcI0gIx4Dau8CsDAcL6FFI5TayBMcIBcjyUEkgPEDhYMWeXsrL/0Klt8YZ2mzHshS1dY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789025264; c=relaxed/simple;
	bh=8tZKXRz1UY3pcsG5dhbObQ/mWujehrDf4DHfiM01ag0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jXcdp2MVz6h8AVOAHHgXp3sSm+wX9VZP3eKM5fqkeESNsMbwF3Dh/nCDZgPmzz9HCFYz9cESWm/5pIBqWCTzfj8MahFqqaISS0Zin4FvD1dez7nMlq7C1WKNVVe/3jPg0d74Az8GC8ac0dAyRxdxNnwZ5iNpVS2fz+uwtt9tEK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RRyb8inN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=a9nDQ5rN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RRyb8inN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="a9nDQ5rN"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68A5Gscu3520306
	for <linux-clk@vger.kernel.org>; Thu, 10 Sep 2026 07:27:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=4e5vZnEtmxTdfneP1Eo9xvuv
	EbGJBqVYovTmDgJ0EzU=; b=RRyb8inNZT/j4oQT/tHNehYQSGJ3yQVs4j2k1qdl
	exhWPwvlBQq8+6/7CnAdn5ayOFbvNT5BR5iatZJkvkxzuHV6lw02WoVzkeZ6Hniz
	HwVgIOeUh7yBDcZ6LtwJ1hOcvRXD6XzF90vrpkYmWI1rnA8etDwGPue5I4Dpx6jc
	F/jbzaNHmqgEKStLI3ZsWyDDCi+LI+i2nttO6GK5DQLUBbdVa9nYcxArIwYMsbTl
	R1/6eF66MnQg+ENVdrIVbfPNuNGxzjJEkVXKgzHzRIHhUk9YLd+w+sUpcTyAb5hJ
	rQANX3t7ZxuDZHtSrYvMpEw/gCmgDnYzL821o0bNXghmDg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gkcyfjq81-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 10 Sep 2026 07:27:41 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-939d6c515deso172223285a.3
        for <linux-clk@vger.kernel.org>; Thu, 10 Sep 2026 00:27:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789025261; x=1789630061; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4e5vZnEtmxTdfneP1Eo9xvuvEbGJBqVYovTmDgJ0EzU=;
        b=a9nDQ5rNogQuRd+uvuaZ4QPbByTRbkFhnNPwNIqcZIVEOKZV1+mqh3bDuTNHAXtVXQ
         g+5SNROOfCzEHeHW6amU+o6t8yVrfZe6LcdI2pa0EowtzvSGUoVgAHYy8rZDOKSJ9FRP
         YXRK1oKA/POf/QGYi3Zg8KDtuH6KntiVR1AuU756Ysn+VtTy3pEt8NRmrngrQCTWaMW+
         28gYr4SpkcQwUC556m4ZO/+yHq3oVLSxq2E7vYoesVcjlJx0j+DiAkIvZtYdsb2EL2KJ
         RnTJnRzA+dXSGD3utkHXi4xdWKP9w9jf0FnkwnokmBeRS8iNENFtBAn0Admpy2kdfCBy
         jCRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789025261; x=1789630061;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4e5vZnEtmxTdfneP1Eo9xvuvEbGJBqVYovTmDgJ0EzU=;
        b=LDTZZTZ8VkjkrtXKoDlxZGgZSPiZrm9mgWYdruzcSPt28SmpqbV1YQdYWqzYGmImQB
         teha1vj9rPfsUsl+T4Iklju8vrX5dBmt7UgdVf4p7dNduOx9agcinyRk+jsut7oCaGOP
         nLLL93J+OVQS9SRD463g32cbqXdPqCFk9rsM8tXv0dsTNjJxlr1SKoEeh6Ppuo338R1Y
         Be337IkVrRJz/mNL8lXp1+Zgq9Z+ceV04sw25j7pNf3d9T/jNsoLC7IoYJnIJwWC+sFm
         teJ5bJsUTNS3C32/ndENjUQ8Nur7TDSjbRAoIm2NLK5pD3phy1ACD5EYYcQAPI/aEPca
         P5xw==
X-Forwarded-Encrypted: i=1; AKwUvByHVLvF/Kac6NiGjA6rNbK8mqm5XSMe4PvGvznj6dAjC9aW2O8WK+Rp+2JWvmcpK0wcnXncELSX9kE=@vger.kernel.org
X-Gm-Message-State: AFuF++kELQt0r3rMZVmc/A2s3CwQ728a3w0YtcLuFW5v8g9kAo0ezdY1
	VLa01HcY0+L061adOQN3jYGBx4TBrcXUfG+iaOAMHerrzZBRwi2jVz4DrIBvbEGzWCQ1satVTQ/
	tde20WiDMM4X76oWO89DcMQ1bPihGpUXTRPg3Yk4EDR3WZbWv0XRjfN7PKSldMAQ=
X-Gm-Gg: AYBFou0kUGptF6JBn1EdFSG+hsvEt/YnSOy1QEuL+je1UMz4rIDeYSR+j5Qab+tDD4M
	xBvBd8xDtlqghJDOgGkkG9yV0Vubdh/D/3FC/QDEhHJIocbDUQehchk3TqwkP8eWaHxuh8dtXpu
	8/k5w6Ltns+dCtZlDjC7WXZVG9Q8THGBYhAuso7p7GuawnNQzZqHx8yM+XcxvxWDqrlMokOunGm
	eAgqO8/q+vmQw09//W063FH+u0W4RdW+7cCjFQRPfxBRebCr+uqXct8cXOoCTa4gqYuYsv3Nej5
	Ts2JmFc1pqylwFmLg6i/BdIFvDDE4bwLuIoR5nh3WXHH7nKhnbXMeYMaDQmjXQKmlD+zzM7f/Mt
	5juilyM3RSnyO
X-Received: by 2002:a05:620a:4629:b0:939:6dea:ce78 with SMTP id af79cd13be357-939d4a8bd93mr701517085a.46.1789025260934;
        Thu, 10 Sep 2026 00:27:40 -0700 (PDT)
X-Received: by 2002:a05:620a:4629:b0:939:6dea:ce78 with SMTP id af79cd13be357-939d4a8bd93mr701513385a.46.1789025260392;
        Thu, 10 Sep 2026 00:27:40 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.7.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d26bf332esm48153215e9.8.2026.09.10.00.27.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 00:27:39 -0700 (PDT)
Date: Thu, 10 Sep 2026 10:27:36 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v2 2/2] clk: qcom: Add support for the camera clock
 controller (CAMCC) on Hawi
Message-ID: <dpvwirynsanzuu5pdtj5d4jrftlikm6fd6unk466bpq7ts7kv2@7ugxxjzxxxdw>
References: <20260908-camcc-hawi-v2-0-f892ba1d118e@oss.qualcomm.com>
 <20260908-camcc-hawi-v2-2-f892ba1d118e@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260908-camcc-hawi-v2-2-f892ba1d118e@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEwMDA4MCBTYWx0ZWRfXyGm7DaWfU3sY
 kkN/OMUmF2zkiF5SOd2Q4q5GHGSVoRVgKnqjqnwbDoadARjKXXW8H+P/2b3kvPMfYcaMV6ebPW9
 kOyuuUaU306XUBWrrZNs9pRBM26777Y=
X-Proofpoint-ORIG-GUID: Libsq6ox6y3Rj_UU6ohtJgA7c7rl-sOk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEwMDA4MCBTYWx0ZWRfX79VhgKsSDVnx
 MBLsSRtYzFx9oh9QkFO7X6pWwP3BKmk4PJ7eDzA1OH0AtjWyI7ppL7ZuTcTUK3nh2vucbkSqH5m
 li3F8amq4aKDUitLR1uNUM/TbLPTJbiU7eznTDl/x/X7Jn4vCApLRzMRSv/lthFAguN8u5703T5
 CK+aYjhD3lZKwLaY285ooj+5Gl6auo/VXSjTfI14yrz9iz5LAw/zngBvVCBrAUF0LdxZAobbXxU
 MaAvZoc4xg1LUuurpw6wGfCC90GHhWgiB5KkQ+M095qDSZ0kyAaLJsBWWeDWVGsUwvC4xX7onLd
 7VY0LlQNuBuVCsjWyhX9+c051xK7c6RsIz1yXV/YoqMbnclg4UvXfBWezCMUtZXfa6ALqrEjQAf
 f1lo8W9F0gPqnGhoz8SpwqoBLIiCi0A688U/lUgAb+WAy9l6cu5LXK5tvOBU1N4bRlngqjhh/Zp
 fcke3SO1fcHsBOMewEg==
X-Authority-Analysis: v=2.4 cv=H5pOUOYi c=1 sm=1 tr=0 ts=6aa25bed cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=dePp4Gl7O00gmbwhyVsZwA==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=sCG5SDo0pyOWuBXq7UcA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: Libsq6ox6y3Rj_UU6ohtJgA7c7rl-sOk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-10_02,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 spamscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 bulkscore=0 adultscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609100080

On 26-09-08 23:01:23, Vivek Aknurwar wrote:
> The CAMCC block on the Qualcomm Hawi SoC provides the primary camera
> clocks. The Camera BIST MCLK clock controller is identical to
> Kaanapali's and hence reuses the cambistmclkcc-kaanapali driver to
> provide the functional MCLK required for camera operations.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Reviewed-by: Taniya Das <taniya.das@oss.qualcomm.com>
> Signed-off-by: Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
