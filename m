Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LgYmFJSb"
Received: from mail-yw1-x1135.google.com (mail-yw1-x1135.google.com [IPv6:2607:f8b0:4864:20::1135])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2C42E19E
	for <linux-clk@vger.kernel.org>; Wed, 22 Nov 2023 02:23:33 -0800 (PST)
Received: by mail-yw1-x1135.google.com with SMTP id 00721157ae682-5c9ea2ec8deso35770687b3.0
        for <linux-clk@vger.kernel.org>; Wed, 22 Nov 2023 02:23:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700648612; x=1701253412; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=I7gMOHwNYsVWl4dwh/EUGgSpYS462NusQClxQC3GVRk=;
        b=LgYmFJSb/3nz8eiMsF/B5bX/GPhQkeU1ohg13CnA3OJq8zTxtpONoj9UHFD55lhS19
         YRwYiHbQ0WLcqPxVHYkM7hIZViAfIZbqMpCMTmI3TmRFcw9RoyPRHqsVPm1sZqb9KZOl
         tc3eOF6EIZgeRZIkf8TZnMaIHbApNpWtWjaJCprHMtRmmK5yjcWh9/MC5VIpyL/ZRAEs
         Ex1JI3a7aFrP2aILklZ5ETS2LCc3ZcyWqHtSq3dqKxED005xjHYSNv571wtkDp9O1NS5
         KCUEyma4cO1Oxqg5t49nxm6TOWobcyqwc+/gLxVTLBmFt0W8PDslsqQTRni8qTJnJj/5
         MZJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700648612; x=1701253412;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=I7gMOHwNYsVWl4dwh/EUGgSpYS462NusQClxQC3GVRk=;
        b=cSZv95+w18lioYoFSEMia+SMiD0dcqWqRfFmOEen0Z8R7Sg3KtmxxOZb346zHtIGWj
         HbDD3hF2aLhfeWkK6ZMpnyiWbClieHrDP31DuRs1Zas8oUmvyYRQL4zC+o3xFEAbNs6t
         MuoZE1/ydh3StDCWniL4vnlox/8g6ug2OQYSXVZoxIDKV25NC/c/veNSukcsij/MMSif
         f2M4UhhKNp94g41agTD2rYGTUsw4UhiQNP88i6HSCpRLE5OMs/UnciVyRHBRDfwoj46Z
         i0lzF9hb5UBNQKO5ciF/hqYUaUZq0L8+FqEFVxOATTSl0sTKXuKuaX07GYzMtJSwQwCy
         hpag==
X-Gm-Message-State: AOJu0YxcQa5rslnEnSne6zN2mgW575Sh4pPsXBbNrNAsm2cKxL9TiC6r
	S7WqU+nxFtRMbnWZ5fh1/6m9XCr71KSbqFbGIte/7Q==
X-Google-Smtp-Source: AGHT+IF9J4EL20aLdTgv/nnAj2YAMdEm4vnfHXwsL/lUYXinkr2QHni/15rEs+qPsWFKZDOAOJaFKUSyAfRIlX6Xojk=
X-Received: by 2002:a0d:ca4f:0:b0:5a7:c8fa:c620 with SMTP id
 m76-20020a0dca4f000000b005a7c8fac620mr1651335ywd.0.1700648612368; Wed, 22 Nov
 2023 02:23:32 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231121-ipq5332-nsscc-v2-0-a7ff61beab72@quicinc.com>
 <20231121-ipq5332-nsscc-v2-3-a7ff61beab72@quicinc.com> <43376552-7e79-4f34-94ca-63767a95564b@linaro.org>
 <8bb79735-3b5d-4229-b0f4-bc50d61fdba1@quicinc.com> <d26eae8d-4968-4ab0-bd9b-696d7b3865ec@linaro.org>
 <2e357fcf-5348-4fb2-b693-2d6bb4d58b21@quicinc.com>
In-Reply-To: <2e357fcf-5348-4fb2-b693-2d6bb4d58b21@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 22 Nov 2023 12:23:21 +0200
Message-ID: <CAA8EJprH5zhSQoTAfQG3nq8Ud=7MVKKhWt0x7SGyFP9JnxWgBA@mail.gmail.com>
Subject: Re: [PATCH v2 3/9] dt-bindings: clock: ipq5332: drop the few nss
 clocks definition
To: Kathiravan Thirumoorthy <quic_kathirav@quicinc.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Andy Gross <agross@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Richard Cochran <richardcochran@gmail.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 22 Nov 2023 at 12:19, Kathiravan Thirumoorthy
<quic_kathirav@quicinc.com> wrote:
>
>
>
> On 11/22/2023 3:42 PM, Krzysztof Kozlowski wrote:
> > On 22/11/2023 11:08, Kathiravan Thirumoorthy wrote:
> >>
> >>
> >> On 11/21/2023 8:36 PM, Krzysztof Kozlowski wrote:
> >>> On 21/11/2023 15:30, Kathiravan Thirumoorthy wrote:
> >>>> In commit 0dd3f263c810 ("clk: qcom: ipq5332: enable few nssnoc clocks in
> >>>
> >>> Where is this commit coming from?
> >>>
> >>>> driver probe"), gcc_snoc_nssnoc_clk, gcc_snoc_nssnoc_1_clk,
> >>>> gcc_nssnoc_nsscc_clk are enabled in driver probe to keep it always-on.
> >>>
> >>> Implementation can change and for example bring back these clocks. Are
> >>> you going to change bindings? No, drop the patch.
> >>>
> >>> Bindings should be dropped only in a few rare cases like clocks not
> >>> available for OS or bugs.
> >>
> >> Thanks Krzysztof. Will drop this patch in V3.
> >>
> >> One more question to understand further. In IPQ SoCs there are bunch of
> >> coresight / QDSS clocks but coresight framework doesn't handle all
> >> clocks. Those clocks are enabled in bootloader stage itself. In such
> >> case, should I drop the clocks from both binding and driver or only from
> >> driver?
> >
> > That's not really the reason to drop them at all. Neither from driver,
> > nor from bindings. You should not rely on bootloader handling your clocks
>
>
> Thanks, lets say if those clocks are not needed at all by OS since QDSS
> is not used and needed only for the boot loaders to access the
> corresponding address space, in such case what can be done? I
> understand, at first those clocks should not have been added to the driver.

First, what is QDSS? Yet another acronym?

Second, if they are not used now, they can get used later.

-- 
With best wishes
Dmitry
