Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C23D04B95A2
	for <linux-clk@vger.kernel.org>; Tue, 22 Sep 2026 20:41:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790109731; cv=none; b=JkshUkC3GywrRBCrEOooFXF5d7IIOL3CsOq4ykTBMCpY0IsxINOfBYEUCGGxVsqZ5/Hc+xmko5R+FJaNdjCrYeUDkKokYC6/0DDrRLPYIY0fKDyB0N2ruCrNw979rVt98ZMZizvLH+KaYNFbhF25lkWimqC8dz8PQVsvam5br0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790109731; c=relaxed/simple;
	bh=vakGs22BbcNPWIXA0rOWiz3UEs+upsXFnGyjZNiJ14s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L9MCmL3YHoFl1IfIfGk8yxMbuiDSaEtayAMn6PJrrn/zCUtUOq8vKMgzKfGqVavUtvIly0NCitHH/YqRmd/Hc0Dd3Zrd95aJETKlqW8FlXW75yDygCv3YFZazfngWTe1WqZ/G3n9WyuwcUOaYjuJOYTw9p8GzyhAlCSfEukwCQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aA0+H6g3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=auBc2efq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aA0+H6g3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="auBc2efq"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68MI72wo1153696
	for <linux-clk@vger.kernel.org>; Tue, 22 Sep 2026 20:41:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=381iYosL+3itKnt5YRFUwV8J
	LY4LD2cyjBXKrHQ2ChI=; b=aA0+H6g3oXd2Sa6hy5rldT9oCLIck0OdeO2hMwWA
	+lOS64/elxIhA6SQVJ2g9onAMk1vq4NMRfVdYqwpdbWvUraWiccVFHulQApfZo7A
	e+akbRWkGnFucV1PBRoMRLpyMihQyGUkHArG4Ulu7sfq0FXmzrEPKzIN4kpRAFxS
	KDP+uwgKchVdocWU8boMFiJpRw1Gw0ORe2pHUsTVuhhXOvyP0R1QqF+upcJ9HBrw
	jJJfe2m25FchMK/Im8DCRNUUtTXliCCVzWlniL2dEY7ThpUPZXIeav9Oglc6rueC
	cfx/gCZvPyQxHHzN0GK29/ShUY4h0WhwqCEMwnf1o/t2qA==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4guvw7hgb9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 22 Sep 2026 20:41:46 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-90e80ce3597so6753426d6.1
        for <linux-clk@vger.kernel.org>; Tue, 22 Sep 2026 13:41:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790109706; x=1790714506; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=381iYosL+3itKnt5YRFUwV8JLY4LD2cyjBXKrHQ2ChI=;
        b=auBc2efqPM0HXKV23CLxk3ddObcdpwVg6OvjPdlAuMjQGBt4Q8hjPY5kxla4e5cpwL
         Qf/5f2hjUNAOcCxLA3vRniuBI1T5sAmt9Yb4TTieDtH8f9K/fNYw3qqN8upDyeRkwPZ0
         zHNN44QQ3MUFC8YA/zlw4hMIn3pHBkx7RefExWwlYJ31sAWc7r2s9ts0kFRlunlH6jdv
         AHu7ZS/gc24iJNs7cuHL/SjdGq4AR62BEIWMVzRjSEbh+CiR46FbEJqJGlY0G6sjozjq
         kkJfxg7QVG8E+OfL00dkjveGKEuSwIEMoChmWqLmXyxWlMYcbp6Rwdrf1aTyHU2DlGl3
         21Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790109706; x=1790714506;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=381iYosL+3itKnt5YRFUwV8JLY4LD2cyjBXKrHQ2ChI=;
        b=IAwHigOxXE4n5Zso3ah54OI3Bl6MPe9hq4eVDqHcLFdqZ3qopDYDtO8omuJUCqmRwI
         bogPMtqreFmgiAx2C03GIM7t9yLKZqkSLFvvI92+FWHlcYg9MxexvLchWMeyWfzowKPz
         DuICgt2/aBAZ0VusxOx5zpq5Dc/vZoaWn5MoTkeFo256R1gOTqWHYzHpO4OCiXPpgn3y
         gO9wlzjBnS++5bO9i/zPVRr+a1yzFilQ5KXtew+nmsk4SiuHrUlTuq5jGWuP37b1FLCB
         9cSJJsx5YD3DpjPJ9abk4Xzmfe5dhlBVCGqH7+9K16eqlSAO++qbId3sws9BOrYLHRX9
         tfpQ==
X-Forwarded-Encrypted: i=1; AKwUvByzUHFWDAquYyeOFfGm7h8rS3FbL/gnwSCFSowxTfqwstunsUQTqk3U95mUMH/s0Sb33Q3l2Tc5r+Y=@vger.kernel.org
X-Gm-Message-State: AFuF++lGCE1ZJNYFs7IOItJdt/VVdiq0e6hGnbYBxhyMlhQYPhu9kx2r
	qb10Vxg32oOgFu0dChI7+uTJvo3fiNRSAERgUZLxbrl+IlpJZfVqJXWLO8plc/l/A4TIYYuTkD8
	8ifVbc67PUW+0Z907KKp3+yjZxfj27YfBowT8bpqZIhPXjakwvUmCtw+YWabmZrA=
X-Gm-Gg: AYBFou0/fb3dBpLX1hdV2w0B9xgmMsTfxrixDuY4yiJzjG4Je1viRXMVlnFWvMOg7Gf
	3Zp/nzfHZXIFV75tnYx1Myvx5RF4V055MUXMH+K8JkZ5N8ObUXZced7KM2wuIaDwQ1edvOEnbHJ
	bZ9R/8XvJ4pWPhgu4HPttk6CkaPwQoH+V4TjoWwLitadFPYhfWWbY1F2keelElQi9iwQtCn8nLh
	OoXZ77iQ1TzuOW0Cd10ruekaU0difEEEFNmA7wCOCXLE8xZIkQaBYeWGANmJfQ3jgSK7Kz9i1HO
	gxpItsZvpeuBhoB1FHv5y1QDosJX8AXFqtUDsciYQT+q4oyGe1CWx9jjaZ0ciTk+nXafuOohE5e
	s7y8T5BCBA3/2vsY=
X-Received: by 2002:a05:620a:4546:b0:93a:10b8:4c3b with SMTP id af79cd13be357-93c25096a2emr96674985a.2.1790109705621;
        Tue, 22 Sep 2026 13:41:45 -0700 (PDT)
X-Received: by 2002:a05:620a:4546:b0:93a:10b8:4c3b with SMTP id af79cd13be357-93c25096a2emr96669785a.2.1790109705035;
        Tue, 22 Sep 2026 13:41:45 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48868779472sm1056265f8f.23.2026.09.22.13.41.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 13:41:44 -0700 (PDT)
Date: Tue, 22 Sep 2026 23:41:43 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/4] clk: qcom: Add lpass clock controller driver for
 Glymur
Message-ID: <dadpw3tpjoitgsm7v7l2wt5jmzdpj2zxjxef2dknxijgn6scsi@cbkn7daetyzi>
References: <20260922184425.56114-1-srinivas.kandagatla@oss.qualcomm.com>
 <20260922184425.56114-5-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260922184425.56114-5-srinivas.kandagatla@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDI5NSBTYWx0ZWRfX5WGCa840KLU/
 IW0JFOss5aTujAx6XWjhhxORfVVHuCLF18P0CuSmWXzCNzU9R1FthrF3saONNVvzjhgHE/UsGmK
 Et6p8UvpKsKB0CKS57TjODkJMGGqG88=
X-Authority-Analysis: v=2.4 cv=ZYqIpcVA c=1 sm=1 tr=0 ts=6ab2e80a cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=gMLPUS0fGnAuojaj054A:9 a=CjuIK1q_8ugA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-ORIG-GUID: yvgGf7TiZsh9nEue6j7TTo486IjR6X5o
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDI5NSBTYWx0ZWRfXyIoNtPWSGxDZ
 HElaMU93WGZVmeldD8yL9tG6XqKm0UKMrzliCqT4sRttc2RJ6uI+fmg0A5cIwUyjeVK0NO6wOvA
 s/SVng43Da91tIhn1JWxGZsvns0h7Fqb/BmDR8TcTXT0LJW1BYE0pDcpbfAJM+2wGWD6KAEnkLs
 NQVyGNL2dSK3EFTtsGuLdt+9YLumKcCvO9DWyzqRM5zxZac/6taIZUUSxBwm39rZs49x7Hyat9v
 BIOJa8rywnPJWKmDwnTz+t3ETtNqm/PmOjMFZYDl7K0o0yKSR2qLcu2Fr8kgtWNgwlz5pWP1w9v
 8s9vztB06boy0CYII6IT7k5d3ekddKptKibZ59+AbIsHwMmcV2ZN/iyWz2q2lUT5aNT0Q6IlsGR
 5BGL285LB7u2uurJql6080+x9/FXwcZoc7fgjK9JLOSkgN9mV1UN81uyfTQKrppJ3fWf/pDKNqz
 7ONq/XAaCboVQJGTzSw==
X-Proofpoint-GUID: yvgGf7TiZsh9nEue6j7TTo486IjR6X5o
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 malwarescore=0 spamscore=0 impostorscore=0
 phishscore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220295

On 26-09-22 19:44:25, Srinivas Kandagatla wrote:
> Add support for the lpass clock controller found on Glymur based devices.
> This would allow lpass peripheral loader drivers to control the clocks and
> bring the subsystems out of reset.
> 
> Currently this patch only supports resets as the Q6DSP is in control of
> LPASS IP which manages most of the clocks via Q6PRM service on GPR rpmsg
> channel.
> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
