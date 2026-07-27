Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E54141A793
	for <linux-clk@vger.kernel.org>; Mon, 27 Jul 2026 13:56:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785160587; cv=none; b=kfEy67x9wnAE6OGDcaGjmJERnNaIYSIbzxnQumFv0YDNJaVHrH+k74qO6VyBy56qpi+oTpW8iZGBDaO3wF0v2oiBU6pi4pWpPPZCB1UP2IRSp4BHP1G5ebuvABrl2dQ92Wxk4P8k+z0D3ngpIriV+1hklJl0bmK4Is+irfMe5uU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785160587; c=relaxed/simple;
	bh=qA326r5sqZxYVFdkUlp/oF9J4KEqqBGpbD0f1T+3rf8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HtMaBRfIKXoN1Q7bNfnqokoFeh8P3UZKmZqJ9PODBQs7ADyDUakzT/R+Ya65nX2/m44oNcXPxEyABbgWUOFBAQnDxDtOxemxcqF8AGCAb7O7mNZ/+z7BkZ66eqOjekrYLf1/GjsKCHKjgr5ICrIkRL7YaAPUt1AqvCD4wgiSxao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=g1hzPGYB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bpni96Rh; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="g1hzPGYB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bpni96Rh"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66RDlfOg033174
	for <linux-clk@vger.kernel.org>; Mon, 27 Jul 2026 13:56:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=XEdThMl9wB0HUHCapGlOKYIA
	ukDNxU4aWNkFOAojSDU=; b=g1hzPGYB160xdVffc+FN+nhqdoD2S9y4lo66GNym
	g814L44HzLD9Unab1F4KdsqZuIEHoNb0Xb/Qidmg0IJvMXzneA+Ha3YK/BXbpWDF
	zMWNimzhe+y8ygHKm7OIR2Y+HZQ8TJDHlFXJyXq31LT1pxAhhIavcxpZGpv9gJxv
	gkCx2F2ECpypciJeo9O9/SxSJxnL/PmazhV6lo98DjmYLCfH6mMPVGI4ud8Jaruq
	2R0QUNp0WlZUiBqJG2FL+K8LD9oVGIFpKWydJSevetfvxSw7Y5yN3jy4/RffmK/H
	CrTpk12mMMbLbo2idoInnRFFnqKJuPJrl+pSpWBKXWSj/Q==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fp4c6135k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 27 Jul 2026 13:56:21 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5174a236220so31046331cf.3
        for <linux-clk@vger.kernel.org>; Mon, 27 Jul 2026 06:56:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785160581; x=1785765381; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XEdThMl9wB0HUHCapGlOKYIAukDNxU4aWNkFOAojSDU=;
        b=bpni96Rhp5SoFG1NsmO5TupE0pYaamx1WZZOwmvI30lsINRaimyOmOgCr2tJE/ziNZ
         C0L+044tHGUxK4BNC+Ntaj0+F6QOzPFm5l77fVUQaThB85k3HKoR7JQ71Mqf2B0xsXhp
         LN6Be/2lpkwI3OfPNkXE1N0+Qg2tIEAT6q7TwjQMtzKIrLPaHN7B4s4PyfGIfi+skhIL
         eEDB2W/5BvUXco10O0zVBOiwlVT042FG9l4mmPJSPAvk8vyxLTrZhYawjU88cPlyTz8z
         y5sBjh5m2sjU7kfuFmZ6PWIbT4y9KdtdKNLhmqGopKjRQly3TtkJQGGiTde9iUwe6uOx
         HaxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785160581; x=1785765381;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XEdThMl9wB0HUHCapGlOKYIAukDNxU4aWNkFOAojSDU=;
        b=LswK1vPjYOAWNJrJXBmvhPCr4/q0f88Q/ud2KVX+mTm+MHvqLs9zDaBMV+RC3mNhUg
         jQTgol3jBvY4Ni+rl3Uetgiz1bEqNAOPAgsJMcvwA0KTZdGNfYqtmdvgd/ExLBBqp926
         gPKQznbo6vxnGtEa/9NT8mPX0aVQVpkj2z0Y24ohqUjIMwq+5wrvBv7BiStsKVcS8KCx
         wXQvyCxOnScp78C+3oM7OActA4q4UfQbZmJ27BRaeDxWZdVEgswmvi+FvySWdTNJetqR
         X75Ep2Qy+3kKflAWr/4N2mV3UbfOeJ83eVAELsgx+wqSPkJYzzk3zH9mU0OfCcOHh3qv
         Jg6A==
X-Forwarded-Encrypted: i=1; AHgh+Rq0VKhgGfYG/4/RPMwUk8B495oYL2t0pmQwrGGJEAQ4s+k1+unNbojzx6BunpkECDLZ71n3UwWEiQQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxe7JAV+A222AbZ1wJmBR18/T9jTVq/VIXhcaA/DPW/u6T1RTyv
	9CvpBpvsA7aBCux2pTlhIdoei/VTTexzD2YrkWIAM1ERfC5PTghbV7PvWwzua3EYxQDGUoHXJiK
	YCeIhKd7pSR2Y6J7KpJXvi9rPWNGm+kfkXuU1s+aOgI/O5IyAFAARmnSMVhVOhoA=
X-Gm-Gg: AR+sD10uwfdPxh7/14/XVsMIVq6jpuG8YlhgJpQR09eLlRorbZz8eHDXCxndb0IGDu3
	ppYXYOnPFXIemNMVfrZRzDvVZz4FKGgMHJ6b+m/EIubwapLF5N1jWmpUR179B/V0N96fy7jSz7H
	Km0SUTdw8dBjW3HoDX8ZJ6tIMwYcXpFxzJUJHYBfYj+WhAW+Bm+un/KXOFN3/U3eqNMyQaOMoGs
	IKXcTL/9yvfzxk050gEiMRQZHgBDHOKPJF+Jb7YGyso/Ph99xNN2SDPoxCGJM2hKoGbHMIw1wA9
	1yTwUpXhX7GMsS3t5C91Z9OZyV7HUqf5uexTUCkdYY1LOYDHBPyczG9GX1YItR7EotztshP9Rqw
	X6VXxEwaHzRQhDec=
X-Received: by 2002:ac8:7fc1:0:b0:51c:7b13:62fa with SMTP id d75a77b69052e-529cd094f4emr9239571cf.80.1785160580695;
        Mon, 27 Jul 2026 06:56:20 -0700 (PDT)
X-Received: by 2002:ac8:7fc1:0:b0:51c:7b13:62fa with SMTP id d75a77b69052e-529cd094f4emr9239081cf.80.1785160580162;
        Mon, 27 Jul 2026 06:56:20 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.163.114])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85c6ef25sm45010704f8f.36.2026.07.27.06.56.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 06:56:19 -0700 (PDT)
Date: Mon, 27 Jul 2026 16:56:17 +0300
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
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v8 07/10] clk: qcom: videocc: Add video clock controller
 driver for Eliza
Message-ID: <rv5s3s24nyzg2ue7ywspu32l23dqhwi2rupcrdzx7dcdgtbyap@pmftq6x63mpw>
References: <20260717-b4-eliza_mm_cc_v6-v8-0-5cca1bef2e48@oss.qualcomm.com>
 <20260717-b4-eliza_mm_cc_v6-v8-7-5cca1bef2e48@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260717-b4-eliza_mm_cc_v6-v8-7-5cca1bef2e48@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=eYQNubEH c=1 sm=1 tr=0 ts=6a676385 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=6dw9+iwJWV8PcCi9M4lOBg==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=d7ClhsmVZ3m4v3ji_18A:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI3MDEzMyBTYWx0ZWRfXwmQuCs82fzij
 +514oAS64EUazwgQdp0J67vIAMEc5TUo/k1LifPWUG5xzoEYAJO2RYCKWBkF1OpB1fBMaGVxRpQ
 Vb2as+73mbD8j+N/4sLvrV9dTuDpPTA=
X-Proofpoint-ORIG-GUID: u9TSmZyCID09_Mx3OGJ1Houv_QWfuEKA
X-Proofpoint-GUID: u9TSmZyCID09_Mx3OGJ1Houv_QWfuEKA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI3MDEzMyBTYWx0ZWRfXyZZR/BTnFzf5
 lyGbVr/MdJ5PMIrho8qAnevEpOM7R00k5Nw3wwZOj8HOGkDb/Z6jcIdD6niyNWapJ2icPJxmq0Z
 rzzJ8/V8CvV35QO4SXjBoERmVWx4myuZZfnfS+9TIj02jzz59OsnKnq0BTJ5Cx5XoKzrg507UbF
 00QmtFbMrpuT/L6IFJzpeNk16xYVuFmbT2Ax47OKpmy/cvgcE7HuDFeiy4NXddjBr+ERSr1QqTk
 o7q+/H9WmlmKCZIvnCbEgB7ySf2nQt4qdZCfyHcfc/qy3KpU9KU/PTQzep5r/8KMe7SGqsEvdJv
 wYunwKJSMcP0qj2jSzKC1ilNxUci/qEFvPo1pRIkgB/RHt7E+czD9ebb0LGtTYW0KHQUEC4M2BI
 WZyPtMhoqAv5DmPY92g7nEuktkWn7TEQra8rhsNBtAWEd7HVe3jkGTytLTr1cDiVagLpjr71Mt8
 wUa0ZWKElffovaUokZg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-27_04,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 spamscore=0 adultscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 impostorscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607270133

On 26-07-17 13:01:51, Taniya Das wrote:
> Add support for the video clock controller for video clients to be able
> to request for videocc clocks on Eliza platform.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
