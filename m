Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8BB94FECF6
	for <linux-clk@vger.kernel.org>; Fri,  9 Oct 2026 18:20:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791570029; cv=none; b=hnUklQfLOtJ9oycNwWkCli6LTdKljNWYW1ztFo8haNsfcEb12UvgI53qCzrcFn11KisMP/zF6QycLvumYm/IS5E5usK1Tq1KwhdD/he2aaOH0uhwDBdIqa9QCt4O0wEsvW1KcebmMqakv5w9hjWWHiRYgehwGN8DHfojcuuQ0Bo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791570029; c=relaxed/simple;
	bh=ynPKjZ8w4+WZ2V/vR3FnT0sUlAi5K7jFsLipAqkA90U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JfF0+eoYixNd6BvpKVr3TcG0CmYdUBOMSVoLGST8qk6b3Xw7h3zQkV33VqcVCjeFCJElYpyBJV4DONtyGaZl5kRQkO91IQEactCvOIDsYgU32NDAbPRh6o2fLsDLQdSNW21jMMOYK0r531K4HSVR8z4xRlg3SdRZMO2/fjkXXeU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hx3h8ODQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hJCOdySk; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hx3h8ODQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hJCOdySk"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 699HZSbD2144022
	for <linux-clk@vger.kernel.org>; Fri, 9 Oct 2026 18:20:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=xuA93s/eGoElb5czpJyJROh7
	QqD7ZLX6LJIbvWy1vVI=; b=hx3h8ODQr/YcVaRIcynDUrfFmc2RYo/d2aidJoFi
	5kzsOg/I/hJSplzLXpqwl8SViv4ZYNtX0OszlWE1EOUmnC1HMHJCJ/eP7ZiuJ/0I
	qsSoMIU8Vn1w04nUIfamL/ywlW2vYfVV13DptMx76ufb77Xik5O7CL6z2nrmVCPv
	L81H5aDeSGq2AU/ptMjC4dRZpe9g4QCYaA07zytIsBpI1Ub5DU8ljME0aPWjiq5u
	2r8cXeEr8UyTx24KJ+VsKElemoSDsMQk6s+H5dwsRHubpYXDaYofXfsnSvL7zvnE
	4kQ/FJWsxQ+KDr/sYMjo+HmkNstvWbKpIh+QRyubBIQUBA==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h74t7r5ks-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 09 Oct 2026 18:20:24 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-91785bd637bso3547946d6.1
        for <linux-clk@vger.kernel.org>; Fri, 09 Oct 2026 11:20:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791570024; x=1792174824; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xuA93s/eGoElb5czpJyJROh7QqD7ZLX6LJIbvWy1vVI=;
        b=hJCOdySkvtE+5YHswRTR6y7CobxWFNWMUOW8Py4uNZA9X3d9t9Ril752mzm1ZuZXGa
         TfBE+QuvlNRUSplIiUcS8H+bh19IcYQ0ahsb3BfYNG2Jt5sZRq8xs3AKl08aZuNYSgLV
         hvgBoMwa3dRUlNoKaiBT3Oy/fqN2rzj8ZKNrFrDBZxpy4dNskES1+Gp9huTVTa3wcNtv
         URXFjPMCRiCggzd93fjuasvnZ7mSJ5pF2LFZbTfB/5OJqD/e8ptbewS8XJUCY4IzH1BQ
         43DaDo/REIkzWn2mmKFp9qt8Kov+L4zz8C4HgPThQVcyhozKhMXvtgmaaQ/QqJja6klR
         Ga7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791570024; x=1792174824;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xuA93s/eGoElb5czpJyJROh7QqD7ZLX6LJIbvWy1vVI=;
        b=PqvxA/qcJ7IAiZmWG0MAKY3YZGcJS8T8uNw8g5nTWmePZQUTpcj1DZ4M033HUWS9LN
         dBmp8K2pld60bBcHXsDMO63LkoRVT1PgRBvFXPWN4t2G8eK02OG6QlDv5KpF06cKfmZ7
         F9R2XlXgCxcuRvPhW+rTV9i6NRg2JL/fFqpDDHx7FIze9rCbf4rs2y8wO2OLG6nsdQbB
         MKNt035utsGAc/mqU6D9O9gOSyLeCd0pqUm88qt85S56Oh/xzT8Sg6iMnmixl2Ik1qY3
         Cb+NI8I1y2YzV3OXxLioi04smKIzEdIOqn+1ezMa1JrfWFSEi3fThVuYAuz5VI7axWBq
         HtmA==
X-Forwarded-Encrypted: i=1; AKwUvBzS+FXElgRY6YSqan909KUpA19famoyEKLYjzpXel6NNwuTpqjgOVhA5fdr7i87y8N68qLrsg9Rewc=@vger.kernel.org
X-Gm-Message-State: AFuF++ldiouN+FP9hr5uolpWPLKm1gx15LjzPEtX/tF1pnfmdkCQgRd3
	oUn73i+tuSQi9xbJtuN4fJxF8E6pdKGAyrcN+2YncHVn764nMIeTZKcSKp//TofWmjaHVajXf9b
	3ZTUY+NCmckdR1aHj0vsptcDSxM2k+SjoMLTMLobUhKNWOcnALoUHlPIRkGtw2Aw=
X-Gm-Gg: AYBFou2YQ15NTuiIF3I+yBZUdMt16eu/1oKGqCUVTZ91aXcIQWsAzaC/N9fl8mQXmAC
	y/squm5ofcWooVJaqd38YbdyYENEMfFCXMbsQrYRNuLx5/WAZ472tKv2PWc4pJ+Wl8UNVzG1ELn
	pMnOL3+rQf/UGjj/weRBX01/Ercm6a970SigQN+djY9mul1amTSXSGrpwf83p77kFSTlurpyuAs
	8hLDyzSRNfQ/pW5Gl/mC56ZtrWE4OYcYIuHgf/IkZULbHoPvNdnFMQ8NWP/8RmZLtiZqevgpy2A
	XkWgIvs4BX49J+VEyf5mDsyG+Cg430HottMscPLNmo2sPwnPkvPmcCG+OtxPsQTtXLwbHV/x+cm
	e6L6CAIg0xOAoLN8=
X-Received: by 2002:a05:620a:40c1:b0:93e:b668:e3e2 with SMTP id af79cd13be357-93ebd0c0011mr424672285a.12.1791570023837;
        Fri, 09 Oct 2026 11:20:23 -0700 (PDT)
X-Received: by 2002:a05:620a:40c1:b0:93e:b668:e3e2 with SMTP id af79cd13be357-93ebd0c0011mr424666785a.12.1791570023140;
        Fri, 09 Oct 2026 11:20:23 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48db94e30a7sm5245243f8f.12.2026.10.09.11.20.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 11:20:22 -0700 (PDT)
Date: Fri, 9 Oct 2026 21:20:21 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>
Subject: Re: [PATCH v2] clk: qcom: negcc-nord: Add frequencies for
 ne_gcc_sdcc4_apps_clk_src
Message-ID: <bqkc6d2zazoqxmj2ryaitwaud52ngwbno2z7a6yswzdkmm6dlr@pgmb3df4aqnv>
References: <20261009-nord-sdcc-clk-v2-1-e00ecfa321c3@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261009-nord-sdcc-clk-v2-1-e00ecfa321c3@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA5MDA3MyBTYWx0ZWRfX1eO5EtFsrqxV
 U5y3UxMZiYZTUwweAU1S9vGv+huqFamQ33eJ2yCp14oD+XBj+zFdvFNQdAG0c8VQyHp5iTj9ft0
 YMVL2KbtCdZhec47UjhWXPcEGa5EO2FL99NzFHK/NVasu8j87KaSF3T0FfSlfAXLl3ZK8qqY+JW
 Z9s2w1Xt6GOv72xEvrGcxmNZqdyq+1kUU62UkDMJklHjENV8rPSfo/ZSIoJuth1tJp6q1N8djB3
 9npQoRut0xqFGt0Dgepjv42+TBSzJG0ForrCfCnB6+xx74m08xJfh0VP6C/Gt6btac979E8dfEt
 vPPFTa8dzpXp1ThseNKd3sT6FVZCE7ywM3WRC9U523WoeBTYuu591WtriUpc6jwVjuY2ibMqCBu
 rr6Tb7aTwSBCNnEwnw2FPx9zCcs1lyBeuwDEQs1blPwKoXUg4EaLvNi6AI772/IMwgv8xF/4lrP
 v2ENURtc6XAMVmX/zQg==
X-Proofpoint-ORIG-GUID: nfWx-8HFWkKTaj7Tc1SXWkUQUram80E8
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA5MDA3MyBTYWx0ZWRfXzmVHfwcT0kAF
 +61CVjyE+tncvL/9uMEYAJ5faWXU+LVLSwC8EaSENyzg1+oSrlJbO6DkMbYQ4ebIx0aFrRhVLBW
 IL2c+QKfYIT9H0fcBEHND0FF4DlpxdA=
X-Authority-Analysis: v=2.4 cv=PaFqFShd c=1 sm=1 tr=0 ts=6ac93068 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=EiYrS7xXfcF7w+nkr41hpQ==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=jrML6d70l2KIAfMEwfgA:9 a=CjuIK1q_8ugA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-GUID: nfWx-8HFWkKTaj7Tc1SXWkUQUram80E8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-09_05,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 impostorscore=0 clxscore=1015 phishscore=0
 suspectscore=0 bulkscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610090073

On 26-10-09 11:38:29, Jagadeesh Kona wrote:
> Add the frequency table entries for ne_gcc_sdcc4_apps_clk_src to support
> the additional clock rates required on the Nord platform.
> 
> Reviewed-by: Taniya Das <taniya.das@oss.qualcomm.com>
> Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
