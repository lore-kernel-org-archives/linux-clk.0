Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 213702D73B5
	for <linux-clk@vger.kernel.org>; Mon, 20 Jul 2026 21:01:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784581277; cv=none; b=Iq3r6hcK/aN4AadhmMI7ELaIvS/8o2HdkoZrAXx5TcGf/2nifwzcEyFS1AQszuMtruBYtnCnq5AYI6ZTy5QwTAdMISZpCicBC2f2Hq8JccsSBNu9pjzy3PqiY1hTRbX+fjer8CETnAg2CBwQEkLZSnX5dkdgNvkG5lsHzto1k+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784581277; c=relaxed/simple;
	bh=3XGxLc0kSNciOygeOoIGLBQnG5qvOMjdq9MJkYJBZA4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QMxR2rw7RZWML+Bdiwoz8iQerlf+u8bjmxnanXEbRtU6DgdFtz3J7tzmsdohrERLwCgjZK6/bbyfmE6xTnmisxb4sVCeHEJCEkXwCRoBzmGdh4IfjTq6t9O7HzUdn9hZWDPRJpgbaupwjWQUferpCxo9jSfp6JD1QQPnpVgjjZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pci748fs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YqqjHCI0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pci748fs";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YqqjHCI0"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66KJTp4r3637881
	for <linux-clk@vger.kernel.org>; Mon, 20 Jul 2026 21:01:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=BB5tZK0t6JhKP0DPoDzhP3tg
	rbpuccWSy4sN7P9ZZTc=; b=pci748fsCwct8R81OTYW/xKHomwvZVdulE3J9PIP
	VLIuN5Ovp+t7zraKmtib8JQVFzrk1HEbEHGjsjuJwY8XuT92P4cfWNZrsD/sRFYQ
	0+AbtVCLjHzqmr3w+hyi3XJainORM8DUZRVbm3FxdFqUPU69/Y2FE2LpPM6XSALo
	uBYTqGIBuOByk1xYSaYmW2RkG1IS4rQ83OLkeF8AUC4FfJtDr+zk+B04W81nJD3N
	sc4s3Oarh0duzxj+JUXFoZ699RVAO7/vjn73d4q4LKQIas33as2tXseH4lQp7MbN
	9W7MZ3DVJjUR/CTIRp/sIKES2ZwzELv1l2vWEydpl+BEPg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fhhgytunu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 20 Jul 2026 21:01:14 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c110a3b6aso116510361cf.1
        for <linux-clk@vger.kernel.org>; Mon, 20 Jul 2026 14:01:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784581274; x=1785186074; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BB5tZK0t6JhKP0DPoDzhP3tgrbpuccWSy4sN7P9ZZTc=;
        b=YqqjHCI0pyL7d/Ax5Sk9kTTqaLFKQV4NvFnJnkjuM/RLlstR0/TlyZZC731tHuLP52
         1Rfjdv6yBs1fo7Dd6zs4TYI7jKIV0/fLahDkD5FiYRFvnZA/m5ojWPL01Kt1XVVa8Msm
         7UhEBKefRsyqXeYvPqML3Grne17WLR6KfyvDYCbev9/Qh5uTssPvtDptmmCF6lSLlfis
         pCGR9tlNwbPocv2V6qH3T9lnZ1w8XWCQPCFlCs781AN43kD53VDsFASoj01xtwFVyHX6
         K0Pb80Hx2oF6GP8LxRPo8xfFYhTguAemMY94RbpqqUcp0Iq+8L/veKqltUKF2qTwFhAq
         42jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784581274; x=1785186074;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BB5tZK0t6JhKP0DPoDzhP3tgrbpuccWSy4sN7P9ZZTc=;
        b=As3fCreRSz313kGcFDMbGXbVRiJgK0wiXUiNNO6IRwKT3mZv7AbBtyyc6XiJNcyBOu
         Q1g0RFgCqjyvGNV4+SZL205+ClZgjrVB1A80aJ6Ac0U/zxoghwFvdv/dCV+cXR1qdzX2
         eU1GuvcaqmQnbr3s43t8+2s14yqN5uqLpNCpRYB4BERr6xSA1/QWPBsTM7o/ztOErPWG
         zNhSgrXKH1C4Iio5PImEIA4RiMnyHu0W2j+0xXJ1iEHyn7PrOx931MFnkTVa+n/scmWS
         1ZWjefAXSCUxAl45IuNra+GFq1T+V6hErXGlSHp+H/mV1hmRtvkw2wArNkt7aCE9ttQI
         l9cQ==
X-Forwarded-Encrypted: i=1; AHgh+Roehg+/MP9ayKa7vLiwvLGSFVmvl19LnjwrnjSjbWeQqF8RkTRydfdWDNxxq2lVYEdNEGQzX/kEeLE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzjJki957SlZ0b/clbQg8vU4DMZa2g5JgUYTaUCpzMhNuyiBe8b
	0R70gerSuLUJkp9OO6GNC6BsRGH5mxt3eyc+mMlFKu+4vHjbojpFFrEJYRwC8ULtIYsM8FOvzdo
	a42Xo2ohDqjConzVSrV+DfewQHEVznbXozfFqwMrTppnYDI/2jaaVIgiG0K0A+OM=
X-Gm-Gg: AfdE7cmWOUEPZk2Gs5n6Sw6Ml1qcYY4loN2MLH8sK/jFUSvQ9P6TFt4ZvdWmX8Qn7JG
	Gzay6q9Mpje9hAT2ZCKheImeSbG/a48KQtMFvrM0LoJ9TCEcKmk0SXRPqJnH0oKFUUaHybQfeuT
	Br9/YrSzLUcj/X7Njee0YH+4Eqm5nR93v4OAhSOjnIp7hCRviExCrXcZh8G/3eXIerWndhHc+IH
	YUOlv3FCk6rxuTO5ZmiKygreb8Cm3iwyDTIXFbjzYXsGRu/8cC1tiCS1lGzOJg2Hqfvttk3Tui+
	Z6Xyym4IIDJ64CvdpK0dXgxfCgIs3nG9moK1yg3dgoYIEjjYUTCvMl5Hfe551CVHsK87PlOBdsT
	W0jxSqkhFF7BJ/78tUYmHpiRiALLjZdZcVovQWglOHCAxpRc9uwwFtpqXbbdOu7amzoxEq02HkA
	TsE1q7lCIPHFcM0Q==
X-Received: by 2002:ac8:5885:0:b0:51c:7b12:1212 with SMTP id d75a77b69052e-5214034500amr149452531cf.80.1784581274213;
        Mon, 20 Jul 2026 14:01:14 -0700 (PDT)
X-Received: by 2002:ac8:5885:0:b0:51c:7b12:1212 with SMTP id d75a77b69052e-5214034500amr149451861cf.80.1784581273516;
        Mon, 20 Jul 2026 14:01:13 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b291d0fdd6sm2543171e87.0.2026.07.20.14.01.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 14:01:12 -0700 (PDT)
Date: Tue, 21 Jul 2026 00:01:10 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Brian Masney <bmasney@redhat.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
        Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Qiang Yu <qiang.yu@oss.qualcomm.com>,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>
Subject: Re: [PATCH v3 2/3] clk: qcom: gcc-glymur: Enable runtime PM
Message-ID: <pg545p76r4lmnz3alukzikpra4sbcvoujvvisymp47lg2worgi@4tj4equp5rcm>
References: <20260715-glymur-fix-gcc-cx-scaling-v3-0-72eb5adad156@oss.qualcomm.com>
 <20260715-glymur-fix-gcc-cx-scaling-v3-2-72eb5adad156@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260715-glymur-fix-gcc-cx-scaling-v3-2-72eb5adad156@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIwMDIyOSBTYWx0ZWRfX7PCMu5ZIBVpv
 x00KdDQ1JuIr5k5GgSkMO33qWS3OaKKA5wne1vOtAzPBbsuq8iT8OD0W3Y+M3H7exnSOagPBu2K
 MJO/mgq0OVJj4bShwTMyKsMsVv5vQjc=
X-Authority-Analysis: v=2.4 cv=LK9WhpW9 c=1 sm=1 tr=0 ts=6a5e8c9b cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=9JxFHelw-nvN-s8SXg4A:9 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: fmSCyg5OSQ-3zoZgyP5TtobOUqF__fnZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIwMDIyOSBTYWx0ZWRfX7XNU6z0PSh/p
 oWZ6N6KzD3qGaRH2W8wFD1IiJobFa2jdlaWmcuZ0rZgFvcSKAIMytc9vjNQcwpe9yQrAeiDqhSb
 NyyiIJFRSJ1f3qovzpklJY0pb324StZuJs9E7+6XdKd7t81vxOU/R9WflcSV/4FX9x4/j2MZ/Ki
 yVS1G822Lszz1jcKQXJeQWpNQpwyInm/kdDFMtV1UFGBJq6JVFf0g9KyTswEgPlEksSdf/R8UkL
 Af2KSoXJFPS8nR9XcX+QGJngAdDmCW5spkaJ9rg20dNPmItPBfxgQ3kG15Uw56UOQ30QuK5pIsm
 JL/3I892xXjiE24L0J28onG5KYZ4fOHFV6//UZPV479YBDUNDnHPowG+5RI1mROrDlMjWiujhFV
 tzIqHHqM0U3ZtRb12512OY8dJ+Nrlj10esTcpTBE2ZRtiHvxOjQuQuBpKdKPZ3aoqfgw9HwOhSS
 dyJawiLHea9+EKSDNIg==
X-Proofpoint-GUID: fmSCyg5OSQ-3zoZgyP5TtobOUqF__fnZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_05,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 phishscore=0 clxscore=1015 malwarescore=0
 suspectscore=0 impostorscore=0 lowpriorityscore=0 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607200229

On Wed, Jul 15, 2026 at 04:29:15PM +0300, Abel Vesa wrote:
> Enable runtime PM for the controller so the common GCC probe path resumes
> the attached domain while registering clocks, resets and GDSCs.
> 
> This lets GDSC consumers propagate their votes through the GCC provider to
> the CX parent domain.
> 
> Fixes: efe504300a17 ("clk: qcom: gcc: Add support for Global Clock Controller")
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/gcc-glymur.c | 1 +
>  1 file changed, 1 insertion(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

> 

-- 
With best wishes
Dmitry
