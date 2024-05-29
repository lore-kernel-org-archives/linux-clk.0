Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com [209.85.219.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2D4E167D98
	for <linux-clk@vger.kernel.org>; Wed, 29 May 2024 07:40:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716968445; cv=none; b=DPEjlx7AS8B6PIFWqpXY9Je8BV2D4ESIlQLgxWNeiTcDwizpVembpLeytM6yy5LwfoLPu4jV5hg99HS1Sh8mdX1Bz5sj6J5xXtZtqURlYXUcUIVdRgILNeCPdiz/epBY+AjrbdGjsI53+LxeVbH2dq1QAja3QJQueVobrY0uxNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716968445; c=relaxed/simple;
	bh=Kq75PX3R0lwU8jkUE+730+MzES2MK6LfrzI3HXbTdic=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CnZQTMBzLdiiQVKqBjvhv9jWOpcYmEintkULhJe3A1gedgWoj0Onb4QHhBD2A4kO4W2ws9AZpVokw2HNDdbXf3OLgzXnWrIfQxWxjuRqou9Qu+C9DKT4I46sQw9CnqgavZ621E05Uz19VXmHWp9XmygL6e3uQ7QUrHBbC53nm50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cXmzgQLN; arc=none smtp.client-ip=209.85.219.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cXmzgQLN"
Received: by mail-yb1-f169.google.com with SMTP id 3f1490d57ef6-dee72970df8so498907276.0
        for <linux-clk@vger.kernel.org>; Wed, 29 May 2024 00:40:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716968443; x=1717573243; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=qi3rq/lKfkTKHCFllxIMfEiNIgwb77QXH8sn4XLhppg=;
        b=cXmzgQLN+TZjCNGfO3XylDs6ogpLcAFtR0AzNJ802+aOO5gSNJRNPDxrYnHgt0AVUN
         k+tLVxMhNpZft7XEjGw8X4hB1D/sf7D+C+eOvNp6il5ABnO6VMZkPH7hQ1yz+qGz76o8
         ajjLmm+SxjJRXcI0Y4tnylhTAB8xaE0Ia6JMf5UxA7Mj/NG74d0QlcUQxRVaOSMZ63Qy
         6s4FyVAAYhoE/2JcR9oJoi9yvLbVXTwf9gByKNcUeMXOiEZ9E5jj6oKqTsK9fvfGmRQT
         HW6trY4WKkFWG9zVhALnOCMH9nYl1AU1zxwX4bX6G/1CuoM788bQ0s9W4FHSfzze4emn
         pIow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716968443; x=1717573243;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qi3rq/lKfkTKHCFllxIMfEiNIgwb77QXH8sn4XLhppg=;
        b=NxsoF1wMLjEjFwGx3LlT2eqNX93SIzNv+7VS5LdfhdQkElwIPwK20WiSuU3O50rVh6
         qxoQfh7ElMdCABv/JTbfCOxL0QllVdvKkCqQc6lxaf9xojHxgqMG7jzXJpjnthiFWA8T
         Pa9gfD3GUwV8B+B47w0PwAOEd8WThlEsyhS4SNiixzCO0jz8eMa4jEubkEV4Y6/ZK0Ys
         z4gKWzgYx6VLIayGTLSwf1ofj61iiGgFIvkmQRhPqk2Vlq241734XaB2TMHY9e0MrGIv
         sAxl8oUgci7LoNMPANYkgYEETXAvLNNhBAZR/jQqcjc1M1x4jKLRDUBEXa+ceLfv8edP
         dE7g==
X-Forwarded-Encrypted: i=1; AJvYcCUxq/4njxToVPVZ0jO+GF4PPARaAZePOa1qO1X42RMXHQj6ASBWZ0RXMEVpMnvz0g0Jut+MF86xKlM8nLVqZe1f0S1yFgFir2yH
X-Gm-Message-State: AOJu0YwV697WZB2+gvJ6vSEsylsyFVoCYp9tRbVkmXxsU7/XLY0u3H7x
	kFYfXPg5tq2JZUJ0nhmf+iBoKp7aQYEa1Rae410IO9kMfNH2LqTTPjNgdXy8OjO3v9dU+A2oKxG
	BqYFFQz3UW8uh3ORl7FGGrTQ0nktO9uzy8YyQlA==
X-Google-Smtp-Source: AGHT+IFvNvlDRb0RRyGJLPid0eBANNAt5GYyAHLtB+VTyIBGbkRANVmJBbGXYfdU28+FTfNGN7gmsi891v5NwqN4/Ys=
X-Received: by 2002:a25:4bc2:0:b0:de6:162f:c71c with SMTP id
 3f1490d57ef6-dfa4649391emr876301276.18.1716968442860; Wed, 29 May 2024
 00:40:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240528-qcom-gdscs-v1-0-03cf1b102a4f@linaro.org>
 <20240528-qcom-gdscs-v1-5-03cf1b102a4f@linaro.org> <a893eb89-1956-4ba2-84cc-e9b64b87524a@kernel.org>
In-Reply-To: <a893eb89-1956-4ba2-84cc-e9b64b87524a@kernel.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 29 May 2024 10:40:31 +0300
Message-ID: <CAA8EJprwQ0N_PfPjTHFppZ2SdQVCXxPrZmVZ0B8+gybm_75toA@mail.gmail.com>
Subject: Re: [PATCH 05/10] dt-bindings: clock: qcom,gcc-nopd.yaml: force node name
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Taniya Das <quic_tdas@quicinc.com>, Robert Marko <robimarko@gmail.com>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, linux-arm-msm@vger.kernel.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 29 May 2024 at 10:39, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> On 28/05/2024 22:43, Dmitry Baryshkov wrote:
> > Force GCC device nodes to have the name 'clock-controller'. Several
> > platforms used 'gcc' here.
>
> Well, only ones coming from Qualcomm being downstream-based:
>
> Author: Varadarajan Narayanan <quic_varada@quicinc.com>
> Date:   Thu Jun 29 11:48:33 2017 +0530
>
> Author: Sricharan Ramabadhran <quic_srichara@quicinc.com>
> Date:   Sun Jan 19 18:43:20 2020 +0530
>
> (and there was also older with node name qcom,gcc, so clearly copy-paste
> from downstream sources)
>
> yet still we do not enforce names in individual schemas. You add it now
> and next month turns out there is a power-reset-clock-controller which
> could use gcc.yaml, but cannot because of node name enforcement.

Ok, please ignore this patch, I'll drop it from the next iteration

-- 
With best wishes
Dmitry
