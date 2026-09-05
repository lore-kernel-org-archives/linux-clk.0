Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 057F938B14C
	for <linux-clk@vger.kernel.org>; Sat,  5 Sep 2026 05:45:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788587152; cv=none; b=ATzeJcLXaN75Ykf3jUY7F/Y4/fduAlWPX3wKeGJzVluex2uQK1S9FBBuOcPFy1HfnBjGsnW1ULfeDr0CYWIHPETmTHHuMGqQbCASsNnev2sfRulwaH4KPo8xwVErpdBcDpQkn3fRTPU/eQxrXxDZ55E/89S9cijTZ4VzVqG86ro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788587152; c=relaxed/simple;
	bh=V7DMQm1HfmyW+rSb8H7jkVdhFD+25OFon4uY7cjC+dg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tgrkO3wkYVU+0THahqZQ6ONeVAARzCAVMLhhpK+Z2dF78v8AaiNKVyDOYGAt5wzunjFrfH279TzIiHE8D4KI198AAtZ9nWhYMPx7Ak/+F7RzqzheHk0EREotJb8ABnRB9yt1idOYqNB8wXZNnXdqUK0QPboZegyZ5TaBkkM5guU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Lb794P8I; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aSRfPMsZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Lb794P8I";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aSRfPMsZ"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6854raOo1973469
	for <linux-clk@vger.kernel.org>; Sat, 5 Sep 2026 05:45:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=AFrExlz4GMAX4ru7ZKdbL+nW
	MkWlCx4pgO+xZDaWALU=; b=Lb794P8IZIRKWlRjXlnBMXCbiItCuDywJfhA0Tqu
	/NG6N8VXIb1atXMzAu+qqfAiUb3Cbp9xu1TKNGu9T0/tjwc6DspQn7lOzl1M9mbq
	ucxfQ7lOMFAHvGgGdwutsPPXtF2cZ2mB1igQY/vAFCSjJ8CGiWFk8C9p97d87Lzk
	qoEr5cVrzS0AGKLiJoMhn7YN2EaBgjkzj6qTDwRrEtoEa7uU8zlAJUmUKtoLSw7D
	4nzn9g/EavPaSb77D29gyK48aNVzffCYu2JJI0Fb2nO/SBLrPUNIRSRdEoTXHOdz
	5GUa3v2yDTxY3G5zxfL9BfM7QAG7ZCNc0027KuU9bIIabQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ggany09pr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Sat, 05 Sep 2026 05:45:49 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-9396e0515dcso102721885a.1
        for <linux-clk@vger.kernel.org>; Fri, 04 Sep 2026 22:45:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788587149; x=1789191949; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=AFrExlz4GMAX4ru7ZKdbL+nWMkWlCx4pgO+xZDaWALU=;
        b=aSRfPMsZPt02NVo+okqpnKLNyfaLPAqtv8gqdVCszILYy0OAPqH1DhmpAeEaE51UBO
         lEFEEkgug5Lq9w9rhTHFdeOAMy1PZ3KoI01GLy+1KgnGty12HfRrOD+8kTQuZKqEqKUq
         0O7mFn6EXYLcyImejAGa7FKU+Y4pfZcfkjMXgj3/qG9sC+raBywlph/ffmISb1aC2kib
         vEjoxfVSt77eD04Kw4IojEc02kILF5HCqZfqGhRQJuFgWlIK5QJwhGbX9erYIbRnbDlI
         NBRo2lyaX/Nu8y/iOGUlB9o5pp1exIEnaRb9s/Ui6AtWyGOPnOrFi8sl1Memlr8jd8qf
         Jliw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788587149; x=1789191949;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AFrExlz4GMAX4ru7ZKdbL+nWMkWlCx4pgO+xZDaWALU=;
        b=grB9vbpoFZquu9X5LObZEepS9kUrFxk323w5baOBVpKPE1IvGZPfWVaDZ/QtuTnDwz
         eH8vLaJvuOwOBgakVtfPN901KVZTzJqcJLhxR+ytjVPATDLgWco0L04oLkwBKgKqpE0R
         lMPP5g2PcLurM66RdUkaA/mmpywTZsHXQm12lI09aB905fy0ecKqoH4OG+x5BpR7GLet
         qOqXbcY/l7PvXSXkwclLaFyUFPH+OmxKUIC5Zcro5PfU0hijXFHmoELNR6P2RYSareYM
         lOEF+M2OWwDgvqphYLM75BsWyRAywVN4a1qL55xq3+JgsYI+HcOkTzC9towYNmA0RHXR
         7vbQ==
X-Forwarded-Encrypted: i=1; AKwUvBx/RoeNXG5xKPdAV0Lute2w7B/0ZlDD6obnnF7XxG4ciH/pie8nk+D0fAglrTsUmdr9o+zXUQ0WE/I=@vger.kernel.org
X-Gm-Message-State: AFuF++mBxnQNF3frwHYejpJNSg3gNydCyjNV/QZGan0oV3Dhdc4WVguC
	p9kxgqu7k2Tkz3CrIHj8SYdmrW/jE2n2L6zWCfReQvOC8WdZHHSAg0Ny4YDJ7AKboIC0u1jS/fS
	6BfB6wQ+yKD0DQpQosLcBgOO8jgRuvvbeMC8Vah2FnFfVejaLyOBainM2B/C0kc4=
X-Gm-Gg: AYBFou3jPprqksvuc/jZcisE+eWTxB53FJpyAaRRXnttkAU+vR8ho5lBtxwpirZC2nY
	ih+RI6d0xdEW0glZn8u03XXehRhkcMCXOW0fxNv0+8y2c4t4HZ200lYQHpCGQoCsK8jFf8s/Waw
	Tt1ON0elnyfnGWZqeBAz0uSKe1O+jn/Y8y1S1J3psPY2l/jzjZA5uYBKWx79XSwJvjkkDfrOovV
	ItR0/lCfep69S5Dfe24Sfjz4tOgE+HnOh0ujTzq5GjZUvbJCamBPpV6pIyvtlH0czXnuwSoF4d1
	wPIN+Rr45VU4vrRpcfRvX9nDYQMrAc3N/EQ9UgJ+cr1u7gU2gGQfs7mJZp89ErXWVWhUGXQaYWb
	3hXb6rZAwDllQ
X-Received: by 2002:a05:620a:3193:b0:939:7e19:ac3 with SMTP id af79cd13be357-9398053f7c5mr1036236785a.45.1788587149067;
        Fri, 04 Sep 2026 22:45:49 -0700 (PDT)
X-Received: by 2002:a05:620a:3193:b0:939:7e19:ac3 with SMTP id af79cd13be357-9398053f7c5mr1036219985a.45.1788587145599;
        Fri, 04 Sep 2026 22:45:45 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce554d52esm167658815e9.3.2026.09.04.22.45.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 22:45:44 -0700 (PDT)
Date: Sat, 5 Sep 2026 08:45:42 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/4] clk: qcom: gcc-glymur: use shared ops for GCC UFS
 RCGs
Message-ID: <kx7uoucnsif3atqsocuavdwvsdny4snav5ncl6e2tappaxdkxe@vpaahkdzj5xf>
References: <20260905-glymur-ufs-clk-changes-v1-0-cdff2c67a8c2@oss.qualcomm.com>
 <20260905-glymur-ufs-clk-changes-v1-4-cdff2c67a8c2@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260905-glymur-ufs-clk-changes-v1-4-cdff2c67a8c2@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=X45i7mTe c=1 sm=1 tr=0 ts=6a9bac8d cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=q7XEBjOi5DRkXzmV0jSBjQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=7NOcbVF-i3gUCoNk4r0A:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: 8-7PQUH2hC2y-TGzAwgpKo6IT010OIhi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA1MDA1NyBTYWx0ZWRfX9KMi+GID4JzO
 ouLok/rxkGY/5LGz2N8c27O3Sbm8wdzyOsj6FZSn/VxH+z1KAa/u3Xaq/v2rqbwWp7o+dLWTvso
 hQpq5h9UScko4TP9sBwrarqosPtJIY//Mn0Z3KQIen4FCLSQMyRQLWEoa19nrEqzPccVdxpSe9O
 krvuc3z/R7lw/0YJ6Dp4a13zzT0Z61dS/OdSKAj4Xqiw7PAwRTgB9dw9VUB8kwW8z3IjBfHwmlU
 5Zu8R9amuxyI8WpISqUAa2mFi5I4rtHvN8dggA0vKtVVfs8MMB7rGDRqKslIKiHnQU2LkgqTkEn
 GV1APjC31XO3qfw8T8JegLYGqa4SkdCslsJ8GCmAlY+mbtM2Ir4aAiyjMw+ntAvJBXzMtxBvA6l
 m7S6hiKMERG3yjszAf7nGupqQS/Eubat6cEpWtD8ewHpEAP2mAmq4rSSy8ujHwzRxyJDJQyhOdp
 rF1ES4MOkJkZsVZTZrg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA1MDA1NyBTYWx0ZWRfX+MpT3502aiqi
 lFkCkgKFDF+V3TQhKp6oVW86Kk5VcZ7XFf62qpUCMztiFDi0XT+5GNkd7jFgrfXkEvGmYvLkrl6
 jEwHzmoBZUYKdKVZFNKjaX1cpMO3prg=
X-Proofpoint-GUID: 8-7PQUH2hC2y-TGzAwgpKo6IT010OIhi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-05_02,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 suspectscore=0 clxscore=1015 adultscore=0
 impostorscore=0 malwarescore=0 lowpriorityscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609050057

On 26-09-05 00:20:45, Jagadeesh Kona wrote:
> Switch GCC UFS RCGs to shared ops so that they are safely parked at XO
> during clk registration.
> 
> This ensures the RCGs are connected to a valid running source clk before
> the UFS GDSC is enabled, which is a requirement for the UFS GDSC power-on
> sequence.
> 
> Fixes: efe504300a17 ("clk: qcom: gcc: Add support for Global Clock Controller")
> Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
