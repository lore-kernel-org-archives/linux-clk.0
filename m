Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3133350A06
	for <linux-clk@vger.kernel.org>; Tue, 11 Nov 2025 10:48:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762858132; cv=none; b=nc9UNRTV/WdmSRCCG5u9aVS7Cq8wbkWiKaZn5+L6eLNtuPEy1JPlrgWova/DMkq+4996fifIxx6JN2Fhl/St0j62pAOsHgk7Xm25KpJBYRTilzUve6d69eyHAJH5JBKjOfZdDvJ3niUM/S0gQwd+XYXWzDHXyS4MYL7HNuKFTzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762858132; c=relaxed/simple;
	bh=Hw7WEkYyfmolBo/cx/Bi+H8d4M4g/yfHEl5/k5dvLtY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rXb2QJcxKpvzimgbgmDhu89D4PAFTYdS9yrEhmXpiiht6fhBTZ0dML9uR0hzuCWrOQ1rBC6bkP5EuD5ueqCYiv4Do4mYWqA75ZMFdYEQgUwIJTragJExFB3IwSEvvypW0KME+ytlFs6vbs5a+1UmfNRlRhLNopoYbvf+D16IDb0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=afUx8KGU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DVIHF1mo; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="afUx8KGU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DVIHF1mo"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AB45m7w1009318
	for <linux-clk@vger.kernel.org>; Tue, 11 Nov 2025 10:48:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=9EItJ5XOQftBUZ4p28CCb/my
	3CzvSqKQjhyPpFTkDrc=; b=afUx8KGU6kXYU5/rvvCLhu9WrLAUTQTH88aJ5JpZ
	eH8L4xr8lru7SjeZz+wvpJ48WZiqLElbeogEr3n74p4n4QU2MLK3Qg1cR+Rf8dmW
	bnQEwS7Cw4dIdqd7DzHJMoLw/5VYByIKjcPJBhOdf14EHrZIUjc9tCO3tjRi/KGA
	3bgzvfVKCVQ0vwbL2Ckedk2zX9UKtQnsb3rVs/1NqQGRyr733quGqd/LnE5pMlDM
	yG5P7m6CcSdrnRBluTrpGOevABMdON3Qzqncl+V8hrLdDhZEP+5t4Q2DaH0f0eaX
	gGomwojRaLAAAcepDPaWaj3DAIMEomERxn4puMN1/4iFog==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4abwtj94r1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 11 Nov 2025 10:48:49 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-8823fbb4990so84138946d6.0
        for <linux-clk@vger.kernel.org>; Tue, 11 Nov 2025 02:48:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762858129; x=1763462929; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9EItJ5XOQftBUZ4p28CCb/my3CzvSqKQjhyPpFTkDrc=;
        b=DVIHF1moRtJ5y0CIiFzGIYZSIQAmQ4nIRUbDEJLUN5DghRYsTPj6HI4fg2nSdQ2oZ1
         m2V3rkFRRdqZEFv5mmsSHCJ7Oblzf8rXm4Y6dFqKGqcxrwS0PGEirzMY9SWqCTLT3O9e
         kCu5uawIm7rdM5WtOmdREPLpIa2HfM/tD7tAjKNe7NyDds5h6r6nPdssib7nB1fRD8Dn
         lQCct0gS0GXzOOD8dt3lGLqN0KbNhEEqJJbRMY1xbLO7uGwDBqqn354bhL9by6vHct5w
         JXraEh9XPEDlv5jB6lc7xhcYPaoBukUdcyKLQCv/1bADOOD0ZKXqxutg91rb91lH3cxA
         1Ndg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762858129; x=1763462929;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9EItJ5XOQftBUZ4p28CCb/my3CzvSqKQjhyPpFTkDrc=;
        b=kX6IMW6ySzKrClNrJaREli3jrbdUlJZNcU78+OnpfRPy9IuoC1rEUV786KKUD2KrnD
         lgq1HeZUBdbt7FrQRddR/NQ9Dm39KRsLp37xm15/0CyxkJ3u8wAlUYWqya6d6hs/DjXw
         AlihKjcQMpjYmj+RIDfcaNkU7WYs/hvAb8gmFfx2Z9wVDzZ2fUe8bhwaHFEND7suhy+d
         ag7PjCaJJec4Kc6wTi1sqooYLUAx/hVKJOuB7bOlNJ9cYaLQEevinijjxQJOwxu0dvB5
         JwjGMyca925hIqFMZ2hHJawwSaK/bAEr/axunZ6c+2Gb/ilrZzCtjdw4WTBAw7PuRMvw
         rWyA==
X-Forwarded-Encrypted: i=1; AJvYcCVnlIn9NM7HjVb8j3SeIcPYycQUCedfsO36vRD7bFvKjcs2Biw6UYTWLJARI+pImUdbW8ycjQKDmFg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8OSV2u6vcL2BcXVn7keYAw0Nd2RhCTsCBb5JlcvKh8JdYwfel
	AobxHkKhkwHvhIXo3tEYBgY/FoHmwSyugfEuuBphnyyTxOq47nuseBW5zUOQRa4wqNaBsEJvvnw
	tP9F8OgCEal7IsjknrG9Pzjq+AF3QsiGmBK1l17lnnPojX/7Lf+2GXFt3Hj16Fns=
X-Gm-Gg: ASbGncvVK7oCaAt+l4vRPyOPkAAhxAlaOuJ0fT5JmtwOru6ma7tKwwiZB5B71OtROC+
	EhsCtigJWNSzqOCIai7wQpo/Eui4790WCz+PI2fLrK9Fr4d2chjMG42tdaQJJ1kztJOzmBwRLMZ
	CsFjRguSBZ3ROCxIpsDZX6icHejrppugJruDpqEOROr9oi1OiL9P9kVMsBFVxgAF0uglNgnK/0p
	uYa06BtPgtIN4uTYBfhBsIvDJK2JzglSGxvGNI3vGyPgpynLVpLY8VAjKuchYwjg7dGkhHtVoGF
	rvD/ZZoTrILLpFLnbGkEL+1fb94MaLPN+HZkLTWZaUmxsPOjZ1nCofDCNiTxE4aGvNfMRCQ+qrF
	b8CbSb75Al5i4y2WeJYIk94VHThpMANV4CLscMyIVuKibvrcyLbbcjeoNObIZeXA0ziZdRb8rIt
	Jy3GaRgd4IH5sy
X-Received: by 2002:a05:6214:1d0d:b0:882:4f53:ed3d with SMTP id 6a1803df08f44-8824f545e1emr99089186d6.36.1762858128903;
        Tue, 11 Nov 2025 02:48:48 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF6DZK5HRkqdWLPvPXUjGlUQbBYjLyUgma8QBrsQcOxkXJuIWMYFM67iw5rk0NIzOjJScMNWw==
X-Received: by 2002:a05:6214:1d0d:b0:882:4f53:ed3d with SMTP id 6a1803df08f44-8824f545e1emr99088906d6.36.1762858128460;
        Tue, 11 Nov 2025 02:48:48 -0800 (PST)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-37a5f0dd32csm45345661fa.35.2025.11.11.02.48.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Nov 2025 02:48:47 -0800 (PST)
Date: Tue, 11 Nov 2025 12:48:46 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, jingyi.wang@oss.qualcomm.com,
        aiqun.yu@oss.qualcomm.com, Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 6/6] clk: qcom: Add support for Global clock
 controller on Kaanapali
Message-ID: <vomgxeiqctbnezwunxovwznbepmhxbmixkcpi7qkmic4xhhm3t@fwc3rp7r7ylm>
References: <20251030-gcc_kaanapali-v2-v2-0-a774a587af6f@oss.qualcomm.com>
 <20251030-gcc_kaanapali-v2-v2-6-a774a587af6f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251030-gcc_kaanapali-v2-v2-6-a774a587af6f@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTExMDA4NSBTYWx0ZWRfX2Avahs0MwBzp
 cUwMuOcq8eURfQp1twqlCQWRKCXrvL5oF6FEJdyk/brurJ182EyaPl/Em2uT4vL7CvC2+YO0MMa
 2glqEcGLsX3T34x3wWI2Nfe4EAeTDpoUEcCd4+8y3Lit4z9E/NfSzRQ4UxxjR6O244iCfre6xCB
 LPFKOBa7O5+Nny0pdAzqJfF7Lx3MwCyaYNG9dBxZBSPqgGMGM5HRRPFKoS9ZakkCOZ8l1xei3xl
 weFkSxQsuf+bzjmq4OYJqhsmpAcAnFbuOLzYG9s+zRiQrQjzXGptyE5G9KMxNCtCzDpwB5R1y9o
 OgPKUXkORaPpwuWCFq1I2mo9I2vQ+nOvzjJGit9lWCABUOQHrBOrngnJeQezAPyxUv+WWZH0r3A
 4ZETDB9H1kOUc/1jhKAGzDu8qR0m/g==
X-Proofpoint-GUID: vqgpv26jvmklk7cy1sK3gZ_7PNL0uXt5
X-Proofpoint-ORIG-GUID: vqgpv26jvmklk7cy1sK3gZ_7PNL0uXt5
X-Authority-Analysis: v=2.4 cv=UI3Q3Sfy c=1 sm=1 tr=0 ts=69131491 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=NTLD1hAujTJExawGBKAA:9 a=CjuIK1q_8ugA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-11_01,2025-11-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 spamscore=0 phishscore=0 impostorscore=0
 adultscore=0 priorityscore=1501 malwarescore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511110085

On Thu, Oct 30, 2025 at 04:39:09PM +0530, Taniya Das wrote:
> Add support for Global clock controller for Kaanapali Qualcomm SoC.
> 
> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/Kconfig         |    9 +
>  drivers/clk/qcom/Makefile        |    1 +
>  drivers/clk/qcom/gcc-kaanapali.c | 3541 ++++++++++++++++++++++++++++++++++++++
>  3 files changed, 3551 insertions(+)
> 
> diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
> index 8ec1803af76cb87da59ca3ef28127c06f3e26d2b..5289a3f07379f3cea6f6192bcb0d73117fe51a5b 100644
> --- a/drivers/clk/qcom/Kconfig
> +++ b/drivers/clk/qcom/Kconfig
> @@ -46,6 +46,15 @@ config CLK_GLYMUR_TCSRCC
>  	  Support for the TCSR clock controller on GLYMUR devices.
>  	  Say Y if you want to use peripheral devices such as USB/PCIe/EDP.
>  
> +config CLK_KAANAPALI_GCC
> +	tristate "KAANAPALI Global Clock Controller"

Kaanapali?

> +
> +MODULE_DESCRIPTION("QTI GCC KAANAPALI Driver");

Kaanapali?

Is there a reason for keeping it in CAPITAL LETTERS?

> +MODULE_LICENSE("GPL");
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
