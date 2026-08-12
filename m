Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A3BC40B108
	for <linux-clk@vger.kernel.org>; Wed, 12 Aug 2026 10:24:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786530277; cv=none; b=sgXnXz0ce8KK0q0utdw3hI8nK7/RBewFGdlHfg2cpjMNAQ+YXivyMDCkC0yRYLiTrGYyunnDSls0Tn4Sqe7xMLp7jB/643fuXcQL8VgffLgA71QSLY/w2TGJGusCBSL1twE5DSemWGer+iHzizWykBP9EDN1N4B/loy79ZzblXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786530277; c=relaxed/simple;
	bh=k2jGqk46sF1bLdy9ZIJ4CzjL14SbrH9QV5M9xpSxDfU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a4oZeretp752qog9vLiIqElqcsLyKyKrLVvfYx/Sd5f4E46KBfdUupqClXzcmvbFN99jqktGZkVHk94rKdb88duqRa6LPLGsUFDReghNMvxH9/RnrJh5EPDxYnOyf/aUG+qA/ZJJR+BvnMHa+eCT/1bU1HY7feZTPRlEaRXuBl8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nSLz45Rk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZoT542if; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nSLz45Rk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZoT542if"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67C9frsw3777858
	for <linux-clk@vger.kernel.org>; Wed, 12 Aug 2026 10:24:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=mGD24sTGT3wBWExobgVbY/RH
	IhyIVBjaK8WNignEdN0=; b=nSLz45RkGSIJy5nhcvKdBAKmB4Stl1E8gnIrIVU3
	bEDjFAQoHPb4JXBkrefsxz6aeeXs5ARQc5tcmBJBk1nT8vhkD6r95jtOUFhx/BqW
	jYEYoGocjrSw/hk6hvVj5rnXBMGx9+YmmwGsRXQyR571aAIvwFEf0f3KlpaTy9Jb
	Q2VElLJCOSHpVGLE0e2Bk7BvhDapbfscX7ZcVbX0cbH8HRtogse2yGGNN+Bz40od
	5Hyj4nCjZhMTJmPgbeJPVCZGIFS/ULZMRgdRGOhHBEn2v6hwDr9r0UL3JbnBfSeO
	bJZ6pxiqP1XNZAGOUHajsYNrr/+ozfIgpmh1zcrBFcVJ6A==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g0nucgae7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 12 Aug 2026 10:24:34 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51bfe3fa93bso7773531cf.2
        for <linux-clk@vger.kernel.org>; Wed, 12 Aug 2026 03:24:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786530274; x=1787135074; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mGD24sTGT3wBWExobgVbY/RHIhyIVBjaK8WNignEdN0=;
        b=ZoT542ifDzKSTCKsJWtM3MjKH2LItk8qfdEyA/4zXxry1xDO6+Pzh70DcFmoqUwYy6
         234aogyQeqRunLB5beR3G2HYULUb52dEQYvii6yZX4KCdmSekbLdjaLwMAejwxYjXvrA
         iQiFO1/wXXGieF/BDOHsl6khQdu5qx7xP87bzccLLniNX6H64LLODZY1M4M/4V9ScFF2
         LUIkTOqQd4dsSc7DEGDjuEVoL/4LjSBa66eQ8nt+unVwNSrCt7y47MEmw6PsL3Cfgi8K
         exSUdraC4F7eQEDSEgp3v3XpTtpIrrqVV9guI/5/Ec2f05j9nfote/si9RkQJWL/iEbY
         Cf+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786530274; x=1787135074;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mGD24sTGT3wBWExobgVbY/RHIhyIVBjaK8WNignEdN0=;
        b=BLl5At+1iWBQ4sZveR7xJyD6KOf5HbKXCC4XEGxlTOU4Yw9COCxGXmoATVU6ucVxlY
         QTCv7zAiedEouworbb6gSF6A03UmPYmpgJ1BGoZV25vqn6neXTuyfnCY8DC3NM9r2tak
         J4U9Rco3F3o+HUt48TTJ15hw8f2+lYO9RjsOEFxEfB9Szsm0qsi0dXSfmDARgcJrtHbx
         Ld0TI/ea+5tUrbupp17u3swtpQEbOlp26BUkdRhEudob7TrlGvUoFBXIvpebwVt4b/VU
         IZ+7jDHjQlMYDr7/8CV5/3qIKR3XbLcUwJySc3SX7YMahZ9mHruhgzzSQjd1s7lPzr0p
         rtcg==
X-Forwarded-Encrypted: i=1; AHgh+RqBm+UpT97TgQnsZ1usmoyLKfW3ddaVgQ6k60ebjp2vfr6o3r6kGPn4rWqXgQCLD3+HaYpgkxSO8go=@vger.kernel.org
X-Gm-Message-State: AOJu0YzmvlUIL/Wl4jPEPveaT6qVbXE0QPABLurjpTIyT3jlEx2/xm/F
	Hn0ghgNi1a0eRL5DIoP61nILqTACUrMst/VF7euU/I7mCr/pc3hYpHzkHmTomhzl+3d/WqAqNpM
	0vykO5c6H+X1bknO/bZl4Ou1lBi5MuS6Kg+8rJQdgT5GhncEaChYkjDgeZ4au068=
X-Gm-Gg: AR+sD13X4GzwBjI5IUouW5vFnrZgHGpYqZ3mp+8gm5Ls8EDyiZyvk17ATmHVjyzwQ7S
	48W9su+3Z+9lK18NtkUW4iHnsiiAq+3dEHucv7ELKRj6rx3iBLSJPavqyxb1ZEhKPo5xEKolBlI
	gy7LHXZE24KAl4fWdM4+xJUjvJzT1ayCKaMRXgm7+Xg82vg6OMCwzGYEcZZ7RG5c/xgot3N/LNI
	c8OROipMfZcGcdaI1MyMS8BYW2x1vc1IO9EVNpCAOlHzRq/1BmeXSYOVfEXWHavi50Q3WTbOHTs
	U6mfU23f2Cn6L7dN30ST8xbsZPonwednIYxzVzrYuFN4O/f0EhBzKfOSeqlmemcPClWGzUw6WKx
	mpI2O58qJYLKxmhM=
X-Received: by 2002:ac8:5d41:0:b0:51f:20e1:137f with SMTP id d75a77b69052e-52d647607a6mr29057941cf.19.1786530274228;
        Wed, 12 Aug 2026 03:24:34 -0700 (PDT)
X-Received: by 2002:ac8:5d41:0:b0:51f:20e1:137f with SMTP id d75a77b69052e-52d647607a6mr29057501cf.19.1786530273692;
        Wed, 12 Aug 2026 03:24:33 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.149])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4997aaa5d04sm58938035e9.2.2026.08.12.03.24.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 03:24:32 -0700 (PDT)
Date: Wed, 12 Aug 2026 13:24:30 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Qiang Yu <qiang.yu@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v3 2/3] clk: qcom: tcsrcc-x1e80100: Migrate to clk_ref
 helper
Message-ID: <a3dfeej45s46qkicay5vsnfoe6ndnllm4llmqbcgjvw4unknpf@tcl5puha5qxi>
References: <20260812-hamoa_tcsr_qref_0812-v3-0-dc7627169c6d@oss.qualcomm.com>
 <20260812-hamoa_tcsr_qref_0812-v3-2-dc7627169c6d@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260812-hamoa_tcsr_qref_0812-v3-2-dc7627169c6d@oss.qualcomm.com>
X-Proofpoint-GUID: xosbtwBO0Kz3PgUNVygFw0MKK-2cNovR
X-Proofpoint-ORIG-GUID: xosbtwBO0Kz3PgUNVygFw0MKK-2cNovR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEyMDA4MyBTYWx0ZWRfX1YJEHN7FKsac
 v1pqg9KsOSqvANtWGG4tkJk84k04MerOS5Py6Hw6k/XwOxIebccAln7GkgU58H9+c1MVuOVS6wE
 4J3NGSVettOp4Pe+tqSdhHPQD3IFIXfJ/XLf6NZprxs91LmWin5r4PJ/PLffTZ7P9lg/4P3qgOj
 JkxTUwnZFvRBz+DESS7pAhuA4G2Wwua2u/I0QF6CHWSzQJl3cXHEzfZeAf+oF4AqKrvDEEK2CBn
 8uK10yeHH/DC0E1AeJ8G6gp/3QMUPCBiVVBk94o+k7f9dI+l+z/AP1Ywr2ffDMsF92lFn62ePe9
 u0JOG60T8Gd+Hj+DQVbKL6Cr7O7d6rcfdQzXAz9n8YLsU+NuMNLyi+DDWJooAByj5ZepW97+Cs6
 FJYk5MHI35x6aQTJLJ5vbrQ5DJhxmRwkljB47qR1pfgdISOFWsSC5pP8IiGtkuKFDjWPFVrjtGv
 8QRGeU6E6oTIkwh/V6g==
X-Authority-Analysis: v=2.4 cv=VcjH+lp9 c=1 sm=1 tr=0 ts=6a7c49e2 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=o07dIpAjZdj6OISZKn0kaw==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=h4UwG7AoVW59HMWry4cA:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEyMDA4MyBTYWx0ZWRfX7FNTtupFBxst
 qsvW7gRvH129Hwm3tWTAp5r5wiloWxt59EU32tQzKUuxR6FhR2V5DG4x0W64CEw0y3JS4olfob5
 3T0s+ld4SRo8nCjYmHYha13s4c8s9Y0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-12_03,2026-08-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 priorityscore=1501 phishscore=0 suspectscore=0
 clxscore=1015 bulkscore=0 lowpriorityscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608120083

On 26-08-12 00:27:32, Qiang Yu wrote:
> Replace local clk_branch-based clkref definitions with descriptor-based
> registration via qcom_clk_ref_probe().
> 
> This keeps the x1e80100 driver focused on clock metadata and reuses
> common runtime logic for regulator handling, enable/disable sequencing,
> and OF provider wiring.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
