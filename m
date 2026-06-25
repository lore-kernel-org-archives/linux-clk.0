Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 312653264E5
	for <linux-clk@vger.kernel.org>; Thu, 25 Jun 2026 13:25:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782393932; cv=none; b=HuhYeSDIKguj5o275qw1yEQi2U11tDQYAV7sMfaORAzTUWCnatN0GxPLHhrM17HKFcuiWE7vWMRkQafoc9c/MbiANY6sRjxtm2UUmFh1zWDQ6YZk1BIa/+HUfBzW4IyRHCQpgM/xGU4amtRV2y2vC8KimUw9eWUiv2eUkRYQEOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782393932; c=relaxed/simple;
	bh=CuJ0BugtLYxwc1oJUnknpEje0INE4USJkZ2gvWfu+d0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bjFnKMlPw/hS2jXx1ETeuKCwrRWSFvTxTUUtVyNaN9LlyrkGmptunNjzZeux8XsmIiirMbMGjBuxyIBQR/86NHQGEn0VPGsBfDVmAeACbjpHHztcKb1OJsj6Iqz34dn4agKd6mVD4tyTlLC+s0lSZsjW1XImlCpsg81LNfJDg/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=HHQfHeXL; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=YjwiGejQ; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="HHQfHeXL";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="YjwiGejQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1782393930;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=1O7Yij0Kw0ewgtwKjx6DJe41xbKPrRcBzrJalpv0Dok=;
	b=HHQfHeXLqlHjEliwt0tF3Ga0Vu8LFq5+NJxAoknMYwHJdemDwLQLkHjC8xu7GI1PUaE94V
	qG+0eCM3IinPur2BH8OjJ+MJDzEEveiqHBKA9Wvly08NNzR36gm2tla5qNmIaNzUdtIBOJ
	3OMTBrhD1/LhDX4rKQlEaoaYhvYZONc=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-657-abzrusFnP9uvXqMGfsq3OQ-1; Thu, 25 Jun 2026 09:25:29 -0400
X-MC-Unique: abzrusFnP9uvXqMGfsq3OQ-1
X-Mimecast-MFC-AGG-ID: abzrusFnP9uvXqMGfsq3OQ_1782393928
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8de60a7a813so55573066d6.3
        for <linux-clk@vger.kernel.org>; Thu, 25 Jun 2026 06:25:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1782393928; x=1782998728; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1O7Yij0Kw0ewgtwKjx6DJe41xbKPrRcBzrJalpv0Dok=;
        b=YjwiGejQC7UPEFYbTu8MLpEUW8Cvvjcc/Hhp41yU+fJCXd6Kg/w40Vjp8lA/vAtasO
         OdA6JkaC+K80qZHOTuM9BL0t/e1uPg+rAZw6ltoZh1zwtdZagzFXPwwAZFXq5ipxd6la
         HV90xu+VrT+KsZ/JI1OzV9Csb0OhRBeurSStcq8VSlu0EUVEuW6thT5K49+tEvu2ikTU
         /ZalshN/jFrIBQrLvuPtNoWwbqSOBVTcnq/N7PpW7PrTb/ew6XPxT+O2maJ02so6QR13
         YHxG6J8B8W6phaLAZf5tnlf1vpfYTjhKoclk4Z/LZLpAJPlo45tkqXWGUO/JNzhoUUJ/
         nQmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782393928; x=1782998728;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1O7Yij0Kw0ewgtwKjx6DJe41xbKPrRcBzrJalpv0Dok=;
        b=esX4ryHt/ZhHQn09Gr58YU1s3gBarq8zF/daWOU1e8At0f+k553GdYdlsgiYGpQReZ
         P9u+mOcMCyxkICktqRZX8DNevGPUMDp8/GTxpZgHQGqkCX1PjEWUFS8ofp5wIUmHgnBm
         lxRVyAZ43F3T74khT6zApU0icp0Rbah6xzWqG89jRASMayN2xqRpIg2Jledc9LzsIVkD
         NXvbN9lknNQyPUtnMTKWGhhMgRBryMPHo8Fbu10okGjlu0gOjrOsmTTj8i0uzt5oD9Xo
         GS2mZN6CtAa5nfE363QXMVtHDFGNqYKwJW8uoGJtnzHjgwtVWeZ2SNISGOXtF7Htk1e1
         J3uA==
X-Forwarded-Encrypted: i=1; AHgh+RpbOVorUOM5y1ImktKY3vaUBTKrTlpj3dwRfJw5N+Pq2B8bRjT++v05wXXBB3ICHvIDHjqFaJ7Ji5w=@vger.kernel.org
X-Gm-Message-State: AOJu0YzI0q7otDwJMB2+DuItOYTX9MKXYJLP3WBjsq+O5PoSb4wZ+lUw
	wb0eSU3Q8pfIdgJhthUB43aCCF3LmWNwGL+Bs5sm56EuXxqnvaJQ5Vt8Q6OhI+LTOjfceWa7VPf
	m7MB0+TMS7BUHACxkDxkotbBLdUvbJkFeL0OsYHbE6PlOysRJvk8eLBJsiFutow==
X-Gm-Gg: AfdE7cn2GBU6QnzAvDjukyIzVZcxpZ07uKUXP7+UmclZjPgyo0GuETrNgkSjA4OKksw
	mi8DqupveU7Z26wVUym5hi8HDnH01fIi6uscxNMmy5czupQHeiWapuupcm+AHx4Z2hjFJ852iwP
	atdfc+WHiiFlKHlhhBaTcGmYSpS7L3rYnu7qWV1PwbSpp6yto7jwQooNQfhkEDQ2tbj0V0NjRzz
	jjzqLV1Re/rUl5+YNMD9lv1kg7UfPaqsFe5ZcQ38GLvvm9iO41eAq8IXTK4bEhr0Bnr65/ImUzK
	K7ICw9sttHFyiL3gLXQy8eajK8fJaUJf3MJqqPKwDp1nAk08kK/7YL0ZJaZRNPUm9PJiiQnDByL
	olrH2cut6
X-Received: by 2002:a05:6214:2f13:b0:8ce:aace:eaf8 with SMTP id 6a1803df08f44-8e6d658248bmr40429256d6.43.1782393928202;
        Thu, 25 Jun 2026 06:25:28 -0700 (PDT)
X-Received: by 2002:a05:6214:2f13:b0:8ce:aace:eaf8 with SMTP id 6a1803df08f44-8e6d658248bmr40428846d6.43.1782393927741;
        Thu, 25 Jun 2026 06:25:27 -0700 (PDT)
Received: from redhat.com ([162.255.191.18])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8df820bfdd0sm180527086d6.35.2026.06.25.06.25.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 06:25:27 -0700 (PDT)
Date: Thu, 25 Jun 2026 09:25:20 -0400
From: Brian Masney <bmasney@redhat.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Saravana Kannan <saravanak@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
	Maxime Ripard <mripard@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	Bjorn Andersson <andersson@kernel.org>,
	Hans de Goede <johannes.goede@oss.qualcomm.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	Jens Glathe <jens.glathe@oldschoolsolutions.biz>
Subject: Re: [PATCH v2 2/5] clk: qcom: common: introduce qcom_cc_sync_state()
Message-ID: <aj0sQLsPAwZPUR-K@redhat.com>
References: <20260616-clk-sync-state-v2-0-15f82c64d95c@redhat.com>
 <20260616-clk-sync-state-v2-2-15f82c64d95c@redhat.com>
 <21bbffb7-ce99-4c38-a5cc-6a3f3c7f48eb@oss.qualcomm.com>
 <aj0TQuaPWmSlLwIw@redhat.com>
 <b790c13d-0a4e-48c9-b8e1-743481c5e6b6@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b790c13d-0a4e-48c9-b8e1-743481c5e6b6@oss.qualcomm.com>
User-Agent: Mutt/2.3.2 (2026-04-26)

On Thu, Jun 25, 2026 at 02:19:21PM +0200, Konrad Dybcio wrote:
> On 6/25/26 1:38 PM, Brian Masney wrote:
> > My next version of this series that I haven't posted yet allows chaining
> > the sync_state callbacks at the driver core level. It doesn't require
> > any of the QC clk driver changes, and will allow us to play nicely with
> > the pmdomain subsystem, and any others the move to sync_state in the
> > future.
> > 
> > I think I see the confusion between us the last few rounds of review. In
> > this series, I added qcom_cc_sync_state() and converted 6 drivers over to
> > use it. (I excluded clk-cbf-8996.c since it is separate.) Only the 6
> > drivers today that called icc_sync_state() now call qcom_cc_sync_state() ->
> > icc_sync_state(). So from my vantage point it is the same overall
> > functionality.
> > 
> > I didn't look at this from the perspective of qcom_cc_sync_state() would
> > be common infrastructure, and a newly added driver in the future that may
> > not interact with the ICC framework may use this. Is this correct?
> 
> Aaah right, my mistake. I assumed that adding that binding
> qcom_cc_sync_state to all qcom clock drivers was the next step.

OK cool... I'm glad we figured this out. Email can be tough sometime! :)

Brian

