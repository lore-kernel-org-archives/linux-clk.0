Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C3D1336EEE
	for <linux-clk@vger.kernel.org>; Fri, 31 Oct 2025 10:14:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761905696; cv=none; b=NGf42XAUvwu/N5zO6WkQM+xNk8DOr6YLw/FzFyP1xsygTCy6J3bHPYo8Im266H8p9OybDZZORFziPy0bOyklqitp3oOUOE9yOgOZEKE+KcJJlHhX51XGX57Xke9ECcoy3cQGN47c3SBTNcLh56F25deorfJF9I/xQO7iVtWRHK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761905696; c=relaxed/simple;
	bh=leEyrcaxgVEFoDQpBRQADrzJ7aEgLp4CWlT8ZId/kkc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LQIkp/5K1hMATuOFeWd1DhOSYP5+Yiy6L26NxnGNdsVdUw7Buk4SDTvEu4XLbM8O+Juz9WtJD5gSBWXi9cGOn9oqB7fW9YO7X087NoAHmWgPTTpGY9WiIkmz+LCfyEl4uuEfu5FNIseDmuxSUdQ6SnOcIbJDNB2wc0lQmt0wIBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Uoan2qzA; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Uoan2qzA"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-47109187c32so10665165e9.2
        for <linux-clk@vger.kernel.org>; Fri, 31 Oct 2025 03:14:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761905693; x=1762510493; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=MTsftEfXvbhUS8zh5vLZ13mZZSic/SfiK4lQDUBWE+o=;
        b=Uoan2qzAIBNrasQ9kywQFbN58IyeAMjIUhAaHttS3uk5y3cip2mZ+qcszej6OEkUf/
         k3+fZLHyGSajsYormDv6TLbhE7Vb2lJyXGRT8mksQP634NpaSDlE5g2+pO59zy35vHrH
         7waG3oAol0tnP5Nt89PHg5c04a5brwVTpCPCFhOwUIzAwxmRTUqXYY3kbGiHDF2USN7c
         xUcSBeWgoyrggWoYcVe8A90ycN7Bz45yxQwlp35FgTKOaKLOS6LELPSK0qePRigT46sl
         83nXJevCKPl7+uStM0sJygXWYrDyFbMKmLldCqt6P0oYgstmHfmRcBnHdnwz1oo2e6eE
         m8GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761905693; x=1762510493;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MTsftEfXvbhUS8zh5vLZ13mZZSic/SfiK4lQDUBWE+o=;
        b=GCrJwO/jJNuGZ6MNDl6gpHNaRLGK8ch1aeTw7gKgtf53Sl++MUkND2x0WQTDIRRIs0
         +fTgnnnSjjBQ26jMzr19IQV6xIC5vidH5nbOpH/1gkVA0p1IohgkjUq7dNzGfDpz7R2i
         50R2cWbiFzN5y95UIa/aANeGTQMpWVBRUL13w5K9ckGIRfsc7sj0VNmjeeo8yIWM/jCD
         WwFuvD6muUiqWP1EpqyGS2KCSKfGhzIlxiwoQhbsxmDq+AszcjnNXNGqqegcls/kKX+t
         ve3gUsVIa6/dJg3TABhcESsTNEDYlJJ+ITmi5P4xOU0NlS6NGO+WI4x/I6bYIvs9xMrS
         Ey0A==
X-Forwarded-Encrypted: i=1; AJvYcCUeQx7OtK0GwKq8eGjths54VaqhNrPBqeYDL6mLfR9NjYiXE6jatJX2NnVx4Uyr/SfpNNaGPqCx3+Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YyBQKWgi1fFSy5xHcDSnfZo8e2P1wX2938KVjxcX/HcirRph6m9
	6vPmUBJm5wamCt6uBg151Z4b6my5WA5BBUpDyAbqOnmkgHlTTvqLE9PHTTJzhTSH29s=
X-Gm-Gg: ASbGnctGr2mjiixeHDoWk004CDY3xXaUsU+h7VDa9LFX8e9ElLG6+Zpz0sCDg3tGaeW
	CU4OtXViZtDgRR5V0616lt7asujoPiDmFX+jwn35IC8qqbP/1JCgg3tCUNrZwqbtO7OMVYEs2+I
	0zGOHfGwsRZxTQxSSf+EotWgNt/yaoFxREOYPe0WhvcPJUrdIwyACRKi3ItSjZMF7yu1UgVRaHe
	KLcz60owCXUEUZI9U67AYpLbf5YYcgESvROXnNUAnu64VpUReMeoOxAYl7MKEVyVFgVwlTzzeWa
	etmmV5Ou42JjTEqXP92Imk9mEBjcAy4N8G53Rzo/5huF7DD/P5oo/2CIUidv5hfcEsijtM9h4/X
	PKBBl1tTpO+PHBGYxMHRTsy2DzVQ11ahN3fDGj6Hzh8ds4H4iV9F1w7aZzBkBrvKW592g6XxpqQ
	eLYqih3Dk=
X-Google-Smtp-Source: AGHT+IH++F13KCtDM5aSmxXlRMY+DkOrtWxUCdzt5Pk2VSvn5xyt2ZqvsBCxug2ep0v/e7g5Vvdu6A==
X-Received: by 2002:a05:600c:3d98:b0:475:dd59:d8ba with SMTP id 5b1f17b1804b1-477305a35c9mr28731235e9.3.1761905692770;
        Fri, 31 Oct 2025 03:14:52 -0700 (PDT)
Received: from linaro.org ([86.121.7.169])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429c11182e3sm2792046f8f.11.2025.10.31.03.14.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Oct 2025 03:14:51 -0700 (PDT)
Date: Fri, 31 Oct 2025 12:14:50 +0200
From: Abel Vesa <abel.vesa@linaro.org>
To: Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, Rajendra Nayak <quic_rjendra@quicinc.com>, 
	Ajit Pandey <ajit.pandey@oss.qualcomm.com>, Imran Shaik <imran.shaik@oss.qualcomm.com>, 
	Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: qcom: tcsrcc-glymur: Update register offsets for
 clock refs
Message-ID: <ievmorxn4cpwx3xnlr5m5j7tgv4p2ixfbgr5bojsetzmdgmid3@764lndl3yqpv>
References: <20251031-tcsrcc_glymur-v1-1-0efb031f0ac5@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251031-tcsrcc_glymur-v1-1-0efb031f0ac5@oss.qualcomm.com>

On 25-10-31 15:32:25, Taniya Das wrote:
> Update the register offsets for all the clock ref branches to match the
> new address mapping in the TCSR subsystem.
> 
> Fixes: 2c1d6ce4f3da ("clk: qcom: Add TCSR clock driver for Glymur SoC")
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@linaro.org>
