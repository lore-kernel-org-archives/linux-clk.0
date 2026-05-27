Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B15713D53C
	for <linux-clk@vger.kernel.org>; Wed, 27 May 2026 23:04:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779923049; cv=none; b=r1JQUg+xsArMwkDVr+90x9Dx74HcKWWXSVyU/pVff2DM7zH2bt0fJ+YvQ21Qg/G0MpjcoOGKa9QZXBSiPP+FCN3T21Pt3Szr3YSeH6bbDeLqUC2b6wmTos426MiIU5cUdfOeP/zxt0kEY0b+kK0My58RG/hAuZLo2Vp0hLRmLS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779923049; c=relaxed/simple;
	bh=UWO3ekrV2IJejy4ykgW10/NFJ8SsTkG7PguyE9QKefw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mKjDfCRxwqNGEOUaLbI/D7madoKd9aZWf30IDKUqNtuoXs0ttn/ildoM+ho5EG9a2NhYnxCYTkUVw4C7j8AEKotkuC03+l0FVPvh9iw3bGhnYWeYsHnF0pGoIIOsJZpJFXz7MRHIxUK3wpKilvyJGZ0AjC4jpR0K8XqJCLFsCsY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=IRJKLL6Y; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=tCvpdgjL; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="IRJKLL6Y";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="tCvpdgjL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1779923046;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=tLMejQTeHZr/KJzPXaBPJSEJrKOB4U1yG1HJSxIAxBU=;
	b=IRJKLL6YrcMA2XU27agZnainEDpnp8aMkcTSTvDUPI3TLsZIUzlMsfzWiD4kL+3b0dtbsa
	SGRHhqnZ3WFHvjorMTQ2iGkEbEvsuLOxnlc6Lt8QcL+v1xIJ4XbGDtQpfxDuD5Feyt7CRo
	QA5+nRCi2EzF9Y4ixm/Zk8XsRhR92AA=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-191-Q-WRuVtpN82Wb-9R4FWMtA-1; Wed, 27 May 2026 19:04:02 -0400
X-MC-Unique: Q-WRuVtpN82Wb-9R4FWMtA-1
X-Mimecast-MFC-AGG-ID: Q-WRuVtpN82Wb-9R4FWMtA_1779923042
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-516cde13e8cso136287541cf.1
        for <linux-clk@vger.kernel.org>; Wed, 27 May 2026 16:04:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1779923042; x=1780527842; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tLMejQTeHZr/KJzPXaBPJSEJrKOB4U1yG1HJSxIAxBU=;
        b=tCvpdgjL6aSoSeLeghrV0c5KMbG+K+gZHxiLiSetGF0Rzgwbaec6M0nyZBtZ22XLGa
         VwJEbKZcFg+B6Z0IDSdkFrJIuXIiroMPoHZL9sLfwWRdVTAVxpXEIF/jGo8TWVm19Aw3
         91Uj1PpS+Ojmnw/gOU613vqRDY8UuU6sVN7YuqpREOqxYOfY7Qeqyi5sVT4bG+0VYXmO
         aEOCWRmXO5dQiFTtx45q82uW+r1ZmJCM5fgGGimca/GHaK4UM8o5AvnMzuJS4M5yq8ae
         IdVg3s5cHcdFQJ94yhKDboG+V3P/PJlCLD/sgZKdQbZl0uZa8CPvLkkbZrW51z4hbobA
         zO6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779923042; x=1780527842;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tLMejQTeHZr/KJzPXaBPJSEJrKOB4U1yG1HJSxIAxBU=;
        b=kPqZdJ8vR5iLIggylgndfTr3J5dVPSQ8rw05xmpoILsgywP3WsUsiNwUtkM4WjSx6j
         QKiY+5qRZFFhpFzZmzZW55KdTlrfSPSWbJmtUDZRSzfJiYRiAiP65q1q/I7KjKl8ADwK
         b+3X5xm0i1LEttAKaN/431IFyOOGYo31fpX3HYBei2+mGaL27gM5E7KOX/msemTAxTqj
         FjRWeyCKJytpMDkjXZmINTUJUX/HFxdoBWeRnLXSmhgpWjHuXF6pWVNsVku7Ya/TYH1q
         Rw6GOVRx0Ih3ocfElY9VDKM122+l72KY9stCPQFzjTLCgBD8E9PNWdSOpZRkSg3SdsU+
         +i4g==
X-Forwarded-Encrypted: i=1; AFNElJ/nP+bl1dukBDZecgSnFtdXo9h6KfM35Bw2VOnY8yKnsbgH6zirwr6p+76SC5vuUBdVg0uQ3mNVrBs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2Wykx7tTLX40pmXa9ScFADICJj6pAS59GhwUF9Vyy2zqkAc0e
	dtbnjSN4xZiiJdslT0JzArlNl9SFr0d3hHr4qlsbW++HVmgm5pwSG+CL7wmII5FuaxE9jowiYuz
	InErrS3yb4TT+hx/Dw8hV8SHNFtY7FJLKdyKJY/xwOvDrt243IHVAfFG1uhFVKw==
X-Gm-Gg: Acq92OHH9GykL60Ehx4ryhr6PcQU0V8+l5VOK+Ygsq7Jx5cMAkGT+9ncgLW4B5KQaC+
	5T51j5Z3/ve6cyrufCx6JBZn/kd+qeN6rRYENcPt2gefOX29w3JfJIfHHjjMcsGvRfJUfrVhFpj
	DO4eCQlr9j/UZZfmihq1/fQKItZMObynTc8z+voviu+hOlg6os2+xLTxAM6I/cTiVeyj2ImN9Mc
	dxM7R237fqLLy622rUFhe8/DasJ917tb4lA0TLMgnWQv70PQI1ZWNMrzmjKktKzQCugNSzs21aR
	bRnZBVXkCYHJd8r2pGdcVf+FP0Wx/B3duwxcGMSGtOsi5oPzuauS679BiSb02EYmtCdNuFjc3mV
	VMybjEShqrUdseC3TGgKfHULewwI=
X-Received: by 2002:a05:622a:8d04:b0:516:d4b1:48e4 with SMTP id d75a77b69052e-516d4b14caamr303864261cf.4.1779923042169;
        Wed, 27 May 2026 16:04:02 -0700 (PDT)
X-Received: by 2002:a05:622a:8d04:b0:516:d4b1:48e4 with SMTP id d75a77b69052e-516d4b14caamr303863711cf.4.1779923041636;
        Wed, 27 May 2026 16:04:01 -0700 (PDT)
Received: from redhat.com ([69.43.42.202])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-51706adc9cfsm53727441cf.19.2026.05.27.16.03.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 May 2026 16:04:00 -0700 (PDT)
Date: Wed, 27 May 2026 19:03:58 -0400
From: Brian Masney <bmasney@redhat.com>
To: Hans de Goede <johannes.goede@oss.qualcomm.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Javier Martinez Canillas <javierm@redhat.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>, Helge Deller <deller@gmx.de>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Rob Clark <robin.clark@oss.qualcomm.com>, linux-clk@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	~postmarketos/upstreaming@lists.sr.ht
Subject: Re: [PATCH 0/3] clk: Add __clk_disable_unprepare_counts_only() and
 use this in simple[fb|drm]
Message-ID: <ahd4XgTo3KZqGS9M@redhat.com>
References: <20260527094811.116977-1-johannes.goede@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260527094811.116977-1-johannes.goede@oss.qualcomm.com>
User-Agent: Mutt/2.3.1 (2026-03-20)

Hi Hans,

On Wed, May 27, 2026 at 11:48:08AM +0200, Hans de Goede wrote:
> 2) One option considered was detaching the simple-framebuffer driver later,
>    after the real display driver has had a chance to claim the clocks. But
>    this won't work in cases where the real display driver picks different
>    parent clocks then the boot firmware did and needs to reparent clocks.

Why won't that work in the case where different parent clocks are selected?
I'll describe a scenario below.

> 
>    Basically the goal is for things to behave as if the simple-framebuffer
>    driver was not there at all, because that leaves the hw in the state
>    the real display driver expects.

I think the deferred unbinding could have some potential here where
there is some kind of notification mechanism between simple-framebuffer
and the real drm driver. So:

- simple-framebuffer driver takes reference(s) to the clk(s).

- real drm driver eventually loads, takes reference(s) to the necessary
  clk(s).

- real drm driver sends a notification to simple-framebuffer that it's
  done, and has control.

- simple-framebuffer can unbind and release its references to the clks.

No clks will be shutdown prematurely in this scenario.

If the real drm driver needs a different parent, then presumably things
should be setup correctly, and simple-framebuffer can have the clocks
shut down when it calls clk_disable_unprepare(). If the real drm driver
needed those clks, then it should hold a reference to them.

I'm intentionally not going through how to do the notification mechanism
here.

Brian

