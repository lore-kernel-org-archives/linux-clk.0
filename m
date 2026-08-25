Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8F6436B90F
	for <linux-clk@vger.kernel.org>; Tue, 25 Aug 2026 07:31:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787643066; cv=none; b=bLvee2uYOwB9UsrSgN3EqdnqKevAvcRzfUDTpEnIsJLnISoq533acx2hPpUAlVZ0eiB+Tlo/e3NHSpqf9uv8hftnmA4m7+MDdb5jdUgWZv2k7heZD+wbHjVqSuswi/qQ0dGo92YlhkJcifX2flCsIDE+7k+d0UPv4fce2OQJ7V4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787643066; c=relaxed/simple;
	bh=DKDyunZ/NHZC1XfvKcnMDrgVZDuJLgBTTWj5TI1HtZw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r3O/v96TxMe0oRy5fwuf6Ydf9abSRkuWuD23nm4/euTdmgaTOy0Sd5Zs59Fh51ubg0u0AV8AqsSqjcSmqqN0Ntrq3LrHx99F8glAeeEtf/nRMfF7MrYjoijcoPAM9Ri++VmtuLc9qWXlqL5rXrlDPgwm9jiqzO2/0nO/YBaWDRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MHx15qsR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bTdgqF/X; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MHx15qsR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bTdgqF/X"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67P3vjlA1149120
	for <linux-clk@vger.kernel.org>; Tue, 25 Aug 2026 07:30:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=3ZrdwNxsDTN3oeIFvijCZf6/
	bTMX0QBcaM7IHsPkBkY=; b=MHx15qsRfgO5CIhtUd43MtQE7Uokp2CNH7d6hCQB
	hzN5OqOu+LDq1NDju4m7GFVgP+PGRSqRLzJckZHU3bXvtSZi678+77Yh3aP3o1GQ
	B+rNkW7+IbVqwWl8d3UO0mT+ZnSNfk0P+vkjRKOKkC3m4nXUrYXlSccoEYcgnn04
	1SgCrA6KCBkAxfRG+VnlCq+iZwGhc615OfOcUIXDxo1B5PVbKn2EsRWoClns7Vrs
	bLtZHsVHNDqsRCmanfKpq5w9xGD5ySLwuYP6q4WM44LUDb30W30fPMSJF8GkztdZ
	qHakSmdKf0g4zLUbSpf0fGjgk9hbGAjA3qZzrd57gglIpg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g93kvrq2n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 25 Aug 2026 07:30:59 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-52ce3c7cb2eso85033961cf.3
        for <linux-clk@vger.kernel.org>; Tue, 25 Aug 2026 00:30:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787643059; x=1788247859; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3ZrdwNxsDTN3oeIFvijCZf6/bTMX0QBcaM7IHsPkBkY=;
        b=bTdgqF/XMxoNt9JRrv686D/xF688fXJWsv4FyVfE1aMolpj332Mw5CuUUlMcBdOv5e
         kErG2924Chil+L1rCbhl+t2/uhW829bU9YfvrrcmyUxK+ydSi1GHwQ9qTrdc29EmYJaM
         qthDlwwTejWX76aY7B+KiYpnnXKZag84GEJ697a5sHN/IddsPzQ9LNgQFweUAoPLPCd8
         0kzNsCEDXXnqeMA+l7sEzZPsDdVnqdV3bjwHKl12oIE92Kh1aAtN+zsNLH+cazWwuH0w
         S5XnL2XFjRjAYL1Jeo+n57DsMuxDQAZVPXQufcwis6ithr4dIFX9NKXX1tohEuceCdTr
         QdZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787643059; x=1788247859;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3ZrdwNxsDTN3oeIFvijCZf6/bTMX0QBcaM7IHsPkBkY=;
        b=DcgvrWx1asjOFu3RI3KFl7GNI9JOZ9HrSoYnq8on+fVBWIdq746F17dXYb10lJiueS
         mjeklPk37ZhO6hS69DSeKBpOL8S1WD2XEsELE/M7d3xfm0ET8RpWqzfY5qJveO8imXE/
         sgvqyN45IEg9jSYqFrppjrGKTQoN0Z0W6nDDsCuU9C6071y/CJAhzvJIe6ySPLAI6CaZ
         r+Kz1cUiTkg2+UUsYDvyliCU80qtlZJzseUInS/jV3ChPgbeHdzo4I/CAOh5vW0r79Jh
         9V1Ucpv2T5x4hoTGB5+00rmc09tLrU1gZ6PMDkch10lC52tZeQ+gRBZsDIwzJALxzCn9
         vFmg==
X-Forwarded-Encrypted: i=1; AHgh+RqoGwGMOOzIdVeslLAX6Ext1Y3eG85KHF+kqKfsm3MGki0ZMoX6xkx5KL+jn9ms1A2E1Qnnys2mPuA=@vger.kernel.org
X-Gm-Message-State: AFuF++kVy0g8de6RlH6YLIyCqWINeqsLFDifoxLNI5LkbRtOMXn0ZFCi
	5WqQR8MSzGdp5rxIueb5kXUC/YC/zsLSJNLK7+C+Wlisrl4DSWaZI09AUDYeuRz33UP394Ga0rX
	C78MMSS4KaC1Sd8TjZIEHYuBgcuW6XKIQHtpoRDCNQn/WNEpgAIPrpmL3YomFHr8=
X-Gm-Gg: AR+sD139htgbwW9a0PRH1FPne3Azve27P2VIBnJuIRy4IftZCssnw9KU9h+z+t3GjqT
	HCqDnUqMpkfUqeXURRc7TcXi7zgJs0s5e69Ya4lHVoK1lZExEvWFineLh8+Tq7voXL8WUO/y2Om
	bNNMkG/iDRrTrQluqN8Ds5jWDl2Biq8mMVk4HO0aJ6gYRBp3vX90/sbXlGayBx/sAZyhYDs7huy
	VHoyIQw6CMjVIsfoW51SaydA/ol+d+zbj/8ymQfoO2fJcUnUWZAtpQZb8m0fR+XZ8W+pezOMt4H
	czAhS2NmF39wB/N77pNr8sirBk8mPf3S8tL09HzyE6nZ9OhXfUWrCBvqfWpUUd4leh65a+JlbOA
	tUgm2QNUNCofafA==
X-Received: by 2002:a05:622a:c85:b0:52e:1364:debd with SMTP id d75a77b69052e-52e2f14fbdemr53017861cf.33.1787643058706;
        Tue, 25 Aug 2026 00:30:58 -0700 (PDT)
X-Received: by 2002:a05:622a:c85:b0:52e:1364:debd with SMTP id d75a77b69052e-52e2f14fbdemr53017231cf.33.1787643058094;
        Tue, 25 Aug 2026 00:30:58 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.13])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c24967383e5sm1583156566b.45.2026.08.25.00.30.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2026 00:30:56 -0700 (PDT)
Date: Tue, 25 Aug 2026 10:30:54 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tengfei Fan <tengfei.fan@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v3 01/47] dt-bindings: clock: qcom: gcc-sdm845: Add CX
 power domain
Message-ID: <qcvnb5nifvwtocgrlc5nddkwgakqjdrqj7uazplj5jpy7jmasu@o555nrglms2j>
References: <20260824-qcom-tie-cx-to-gcc-v3-0-f1205a92682b@oss.qualcomm.com>
 <20260824-qcom-tie-cx-to-gcc-v3-1-f1205a92682b@oss.qualcomm.com>
 <6d8b7fc0-9bd5-4bfa-97b0-a20bf01779c5@kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6d8b7fc0-9bd5-4bfa-97b0-a20bf01779c5@kernel.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI1MDA2MiBTYWx0ZWRfX4+lNj3sWhP3g
 p4CQVhaIYLjhTZ/yCpwWQb1dxxHNkz5oNb4AoH3fZrcX504XwstUBQkLU8snuIEXw4a2mEIGgcA
 xBKQYY96mu6Ls4ISCn8ru55AQpYpmxbwL/gIlVB1JJcv8WM/Qn+hbAvffAsUhAz9R3PI8u7aKSH
 pSh6mwFjqAdW4BIwoN0siddq2oTllGrPNfsuBYM7Ooi2gTt5QmOe3BoqJJrvn1wCN7KuIdgL/X8
 QuTxd/N637J8mkWtxUykue16JsciWY7uOFbF7mGRq0tvukJukn0PFmxgNeWmTvF99Zz9IeXbdXi
 7oJzGDGzP/voFQQ2ifKZwjtoeCOPaalDf0C0mByJtfHnQD/ya3olKaJaQyWhY7mgS5CzqHXfOrh
 jOzXNfeI3Pao3NY+tr2lMind+tvIVsP8gF+oOT4TmnI0zMIe36G+CsWKYzsKbY1T3JWNhvhTJw/
 1k1pSQUXQFYiCH5KZ6g==
X-Authority-Analysis: v=2.4 cv=aPHAb79m c=1 sm=1 tr=0 ts=6a8d44b3 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=clBUptZa5v5FR042Ey+sjA==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=i6VLWpIXabWwsCG0LkoA:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI1MDA2MiBTYWx0ZWRfX0nU+OgLOF5Dg
 ChP5zgyqMSxgDyPbwgIfwM9KAHujMOYvU3/Mp4xZTXpUustkyUgDhonlsAbdegXyD54dMz7swF/
 SYL/INcbAEML2kIu+S8s4mnVKUNmW9A=
X-Proofpoint-ORIG-GUID: 2FhUoQZWC9tafxLM9pp4NCOiB8J71VDc
X-Proofpoint-GUID: 2FhUoQZWC9tafxLM9pp4NCOiB8J71VDc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-25_01,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 adultscore=0 malwarescore=0 clxscore=1015
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608250062

On 26-08-24 22:39:28, Krzysztof Kozlowski wrote:
> On 24/08/2026 13:53, Abel Vesa wrote:
> > Describe the CX power-domain dependency for SDM845 and SDM670 GCCs, and
> > require it for both compatibles.
> > 
> > Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> > ---
> >  Documentation/devicetree/bindings/clock/qcom,gcc-sdm845.yaml | 8 ++++++++
> >  1 file changed, 8 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc-sdm845.yaml b/Documentation/devicetree/bindings/clock/qcom,gcc-sdm845.yaml
> > index a7523a414341..980edcd244a2 100644
> > --- a/Documentation/devicetree/bindings/clock/qcom,gcc-sdm845.yaml
> > +++ b/Documentation/devicetree/bindings/clock/qcom,gcc-sdm845.yaml
> > @@ -31,6 +31,8 @@ properties:
> >      maxItems: 5
> >  
> >    power-domains:
> > +    description:
> > +      A phandle and PM domain specifier for the CX power domain.
> 
> Describe items instead:
> items:
>   - description:
> 
> Also, "A phandle and PM domain specifier for the" is redundant part of
> sentence. This cannot be anything else than phandle and PM domain, thus
> just say "CX power domain".

Will fix.

> 
> >      maxItems: 1
> >  
> >  required:
> > @@ -56,6 +58,8 @@ allOf:
> >              - const: bi_tcxo
> >              - const: bi_tcxo_ao
> >              - const: sleep_clk
> > +      required:
> > +        - power-domains
> 
> Why? Commit msg should tell me why you are changing ABI. It is actual
> ABI break without an explanation...

Actually, I should've kept the same commit message as for the other
bindings.

Thanks for reviewing.

Abel
